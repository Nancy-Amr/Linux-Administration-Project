#===================================================================================================
# Name        : Makefile Project
# Copyright   : Edges For Training
# Description : A Makefile to compile and link a modular program with separate source files for 
#               simple and complex operations. It organizes include directories, source directories,
#               and builds the final executable. This is just a template you can start with your
#				own Makefile (remember makefile names: Makefile - Name.mk - Name < make -f Name >)
#===================================================================================================

# Main Directories
ROOT_DIR = ..
APP_DIR = $(ROOT_DIR)/Application
MODULES_DIR = $(ROOT_DIR)/Modules

# Modules Directories OK
CAESAR_CIPHER_DIR = $(MODULES_DIR)/caesar_cipher
XOR_CIPHER_DIR = $(MODULES_DIR)/xor_cipher

# Application Directories
APP_OUT_DIR = $(abspath $(APP_DIR)/out)
APP_OBJ_DIR = $(APP_OUT_DIR)/gen
APP_LIB_DIR = $(APP_OUT_DIR)/libs
APP_BIN = $(APP_DIR)/output

# Modules Source files
CAESAR_CIPHER_SRC = $(CAESAR_CIPHER_DIR)/src
XOR_CIPHER_SRC = $(XOR_CIPHER_DIR)/src

# Modules Object files
CAESAR_Decrypt_OBJ = $(APP_OBJ_DIR)/caesar_decrypt.o
CAESAR_Encrypt_OBJ = $(APP_OBJ_DIR)/caesar_encrypt.o
XOR_Decrypt_OBJ = $(APP_OBJ_DIR)/XOR_decrypt.o
XOR_Encrypt_OBJ = $(APP_OBJ_DIR)/XOR_encrypt.o

# Modules Library files
CAESAR_CIPHER_LIB = $(APP_LIB_DIR)/libcaesar.a
XOR_CIPHER_LIB = $(APP_LIB_DIR)/libxor.so

# Application Source files
APP_SRC = $(APP_DIR)/app.c

# Application Object files
APP_OBJ = $(APP_OBJ_DIR)/app.o


CC = gcc
CFLAGS = -I$(CAESAR_CIPHER_DIR)/inc -I$(XOR_CIPHER_DIR)/inc
LFLAGS = -L$(APP_LIB_DIR) -lcaesar -lxor -Wl,-rpath,$(APP_LIB_DIR)

all: create_dirs $(APP_BIN)

create_dirs:
	mkdir -p $(APP_OBJ_DIR) $(APP_LIB_DIR)

$(APP_BIN): $(APP_OBJ) $(CAESAR_CIPHER_LIB) $(XOR_CIPHER_LIB)
	$(CC) $(APP_OBJ) -L$(APP_LIB_DIR) $(LFLAGS) -o $(APP_BIN)

$(CAESAR_CIPHER_LIB):
	$(MAKE) -f caesar_cipher.mk -C $(CAESAR_CIPHER_DIR) LIB_DIR=$(APP_LIB_DIR) GEN_DIR=$(APP_OBJ_DIR)

$(XOR_CIPHER_LIB):
	$(MAKE) -f xor_cipher.mk -C $(XOR_CIPHER_DIR) LIB_DIR=$(APP_LIB_DIR) GEN_DIR=$(APP_OBJ_DIR)

$(APP_OBJ): $(APP_SRC)
	$(CC) -c $(APP_SRC) $(CFLAGS) -o $(APP_OBJ)

clean:
	rm -rf $(APP_OUT_DIR)

# 1) Compile and archive the caesar_cipher static library:
#       - a rule to compile the 2 source files and generate 2 object files 
#       - a rule to archive these 2 object files into a library file
# 
# 2) Compile and generate the xor_cipher dynamic library:
#       - a rule to compile the 2 source files and generate 2 object files 
#       - a rule to link these 2 object files into a dynamic library file
# 
# 3) Compile the app source file to generate the app object file (one rule)
# 
# 4) Link them all together (one rule)
# 
# 5) one rule to clean the project
