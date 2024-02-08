CXX := g++
CXXFLAGS := -Wall -Isrc/inc
LDFLAGS := -Lsrc/lib
LIBS := -lsfml-graphics -lsfml-window -lsfml-system

SRC_DIR := src
OBJ_DIR := bin\obj
BIN_DIR := bin

SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
BIN := $(BIN_DIR)/acorn.exe

$(shell if not exist "$(OBJ_DIR)" mkdir "$(OBJ_DIR)")
$(shell if not exist "$(BIN_DIR)" mkdir "$(BIN_DIR)")

all: $(BIN)

$(BIN): $(OBJ)
	$(CXX) $^ -o $@ $(LDFLAGS) $(LIBS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: all
	$(BIN)

clean:
	del /Q /F $(OBJ_DIR)\*
	del /Q /F $(BIN_DIR)\acorn.exe

.PHONY: all run clean