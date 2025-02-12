#ifndef IO_H
#define IO_H

// Function prototypes for input/output handling
void read_input(const char *source, char *input);
void write_output(const char *destination, const char *output);

// Reads a file and stores its content in the provided buffer
void read_file(const char *file_path, char *buffer, size_t buffer_size);

// Writes the provided content to a file
void write_file(const char *file_path, const char *content);

#endif // IO_H