#include <SFML/Graphics.hpp>

int main() {
    sf::VideoMode desktop = sf::VideoMode::getDesktopMode();
    unsigned int windowWidth = desktop.width * 0.95;
    unsigned int windowHeight = desktop.height * 0.80;

    sf::RenderWindow window(sf::VideoMode(windowWidth, windowHeight), "Acorn", sf::Style::Default);

    sf::Color backgroundColor(0x1D, 0x1D, 0x1D);

    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear(backgroundColor);
        window.display();
    }

    return 0;
}
