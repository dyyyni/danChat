CC := gcc
CFLAGS := -g -Wall

BUILD_DIR := build
BIN := bin
OBJ := obj

SRC_FILES := $(wildcard src/client/*.c)
OBJ_FILES := $(patsubst src/client/%.c,$(BUILD_DIR)/$(OBJ)/%.o,$(SRC_FILES))

TARGET1 := $(BUILD_DIR)/$(BIN)/client

.PHONY: all clean directories

all: directories $(TARGET1)

directories:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/$(BIN)
	@mkdir -p $(BUILD_DIR)/$(OBJ)

$(TARGET1): $(BUILD_DIR)/$(OBJ)/client.o $(COMMON_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/$(OBJ)/%.o: src/client/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf $(BUILD_DIR)
