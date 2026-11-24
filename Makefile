CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra -Wpedantic -Wconversion -Wshadow -O2
TARGET := aima

.PHONY: all test clean
all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) main.c -o $@

test: $(TARGET)
	@set -eu; first=$$(mktemp); second=$$(mktemp); \
	trap 'rm -f "$$first" "$$second"' EXIT HUP INT TERM; \
	./$(TARGET) > "$$first"; \
	./$(TARGET) > "$$second"; \
	cmp "$$first" "$$second"; \
	grep -q "completed successfully" "$$first"; \
	test "$$(grep -c '^Iteration ' "$$first")" -eq 5; \
	grep -q '^Iteration 5: observations=5 knowledge=5 vision=42x42 vocabulary=29$$' "$$first"

clean:
	rm -f $(TARGET)
