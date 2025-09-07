INCLUDE_DIR = ./inc
SOURCE_DIR = ./src

GEN_DIR ?= .
LIB_DIR ?= .


CC = gcc
CFLAGS = -I$(INCLUDE_DIR)
LIB_OBJ = $(GEN_DIR)/caesar_encrypt.o $(GEN_DIR)/caesar_decrypt.o
LFLAGS = -lm
LIB = $(LIB_DIR)/libcaesar.a
AR = ar


all: $(LIB)
$(LIB): $(LIB_OBJ)
	$(AR) -cr $(LIB) $(LIB_OBJ)

$(GEN_DIR)/caesar_encrypt.o: $(SOURCE_DIR)/caesar_encrypt.c
	$(CC) -c $< $(CFLAGS) -o $@

$(GEN_DIR)/caesar_decrypt.o: $(SOURCE_DIR)/caesar_decrypt.c
	$(CC) -c $< $(CFLAGS) -o $@

clean:
	rm -f $(GEN_DIR)/caesar_*.o $(LIB)
