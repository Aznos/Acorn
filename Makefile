all:
	g++ -o bin/acorn src/main.cpp -Isrc/inc -Lsrc/lib -lsfml-graphics -lsfml-window -lsfml-system
	./bin/acorn