CXX = g++

EXE = acorn

SRC_DIR = src
BIN_DIR = bin
INC_DIR = $(SRC_DIR)/inc
LIB_DIR = $(SRC_DIR)/lib

CXXFLAGS = -std=c++17 -I$(INC_DIR) -Wall
LDFLAGS = -L$(LIB_DIR) -lsfml-graphics -lsfml-window -lsfml-system

SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BIN_DIR)/%.o)

all: $(BIN_DIR)/$(EXE)

$(BIN_DIR)/$(EXE): $(OBJECTS)
	$(CXX) $^ -o $@ $(LDFLAGS)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: $(BIN_DIR)/$(EXE)
	./$(BIN_DIR)/$(EXE)

clean:
	rm -rf $(BIN_DIR)/*.o $(BIN_DIR)/$(EXE)

.PHONY: all clean