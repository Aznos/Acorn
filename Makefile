CXX = g++
CXXFLAGS = -std=c++17 -Isrc/inc -Isrc/inc/imgui -Wall
LDFLAGS = -Lsrc/lib -lsfml-graphics -lsfml-window -lsfml-system -lopengl32
IMGUI_SRCS = $(wildcard src/inc/imgui/*.cpp) src/inc/imgui/imgui-SFML.cpp
SRCS = $(wildcard src/*.cpp)
OBJS = $(SRCS:src/%.cpp=bin/%.o) $(IMGUI_SRCS:src/inc/imgui/%.cpp=bin/%.o)

EXE = bin/acorn

all: $(EXE)

$(EXE): $(OBJS)
	$(CXX) $^ -o $@ $(LDFLAGS)

bin/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

bin/%.o: src/inc/imgui/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf bin/*.o $(EXE)

.PHONY: all clean
