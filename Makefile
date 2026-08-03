# Makefile for simpleC++ (the "nano_cc" toy C/C++ -> x86_64 compiler)
#
#   make           # build ./nano_cc with GCC
#   make run       # build, then compile the bundled sample to sample.s
#   make clean     # remove build artifacts
#
# The compiler itself is a single, self-contained C translation unit
# (simpleC++.c). It only needs a hosted C library and a C11 compiler.

CC       ?= gcc
CFLAGS   ?= -std=c11 -O2 -Wall -Wextra
SRC       = simpleC++.c
BIN       = nano_cc

.PHONY: all run clean

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) -o $@ '$(SRC)'

# Demonstrate the built compiler: translate a small program to assembly.
run: $(BIN)
	./$(BIN) sample.c sample.s
	@echo "---- sample.s ----"
	@cat sample.s

clean:
	rm -f $(BIN) sample.s
