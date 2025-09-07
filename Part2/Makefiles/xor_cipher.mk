INCLUDE_DIR = ./inc
SOURCE_DIR = ./src
GEN_DIR ?= .
LIB_DIR ?= .


CC = gcc
CFLAGS = -I$(INCLUDE_DIR) -fPIC
LFLAGS = -lm -Wl,-rpath,$(DYN_LIB_DIR)
LIB_OBJ = $(GEN_DIR)/xor_encrypt.o $(GEN_DIR)/xor_decrypt.o
LIB = $(LIB_DIR)/libxor.so

all: $(LIB)

$(LIB): $(LIB_OBJ)
	$(CC) $(LIB_OBJ) -o $(LIB) -shared

$(GEN_DIR)/xor_encrypt.o: $(SOURCE_DIR)/xor_encrypt.c
	$(CC) -c $< $(CFLAGS) -o $@

$(GEN_DIR)/xor_decrypt.o: $(SOURCE_DIR)/xor_decrypt.c
	$(CC) -c $< $(CFLAGS) -o $@

clean:
	rm -f $(GEN_DIR)/xor_*.o $(LIB)
