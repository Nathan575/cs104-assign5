# Compiler
CC = gcc
CFLAGS = -Wall -Werror -std=c99
# Warnings, warnings as errors flag, c99 flag, etc.

# Source files and output binary
SRC = main.c addition.c subtraction.c multiplication.c division.c
OBJ = $(SRC:.c=.o)
TARGET = calculator

# Default rule: Compile the program (if only make)
all: $(TARGET)

# Target depends on the .obj files
$(TARGET): $(OBJ) 
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

# Compile .c files into .o files
# Dependency on operations.h, converts .c to .o
%.o: %.c operations.h
	$(CC) $(CFLAGS) -c $< -o $@

# Clean rule to remove binaries and object files
clean:
	rm -f $(OBJ) $(TARGET)
