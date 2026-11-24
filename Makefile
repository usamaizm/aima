CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra -Wpedantic -O2
TARGET := aima

.PHONY: all test clean
all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) main.c -o $@

test: $(TARGET)
	./$(TARGET) | grep -q "completed successfully"

clean:
	rm -f $(TARGET)
