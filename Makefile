CFLAGS = -Wall -Werror -std=c99
OBJ = gcc -c $< -o $@ $(CFLAGS)

.PHONY: all clean

all: bin build bin/chessviz

bin/chessviz: build/main.o build/board_print_plain.o build/board_start.o build/board.o build/board_read.o
	gcc $^ -o $@ $(CFLAGS)

build/main.o: src/main.c
	$(OBJ)

build/board_print_plain.o: src/board_print_plain.c src/board_print_plain.h
	$(OBJ)

build/board_start.o: src/board_start.c src/board_start.h
	$(OBJ)

build/board.o: src/board.c src/board.h
	$(OBJ)

build/board_read.o: src/board_read.c src/board_read.h
	$(OBJ)

build: 
	mkdir build
bin:
	mkdir bin

clean:
	rm -rf build
	rm -rf bin
