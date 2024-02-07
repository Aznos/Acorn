#include <SFML/Graphics.hpp>

int main() {
    sf::VideoMode desktop = sf::VideoMode::getDesktopMode();
    unsigned int windowWidth = desktop.width * 0.9;
    unsigned int windowHeight = desktop.height * 0.80;

    sf::RenderWindow window(sf::VideoMode(windowWidth, windowHeight), "Acorn");
    window.setFramerateLimit(60);

    sf::Color bgColor(0x1d, 0x1d, 0x1d);

    while(window.isOpen()) {
        sf::Event event;
        while(window.pollEvent(event)) {
            if(event.type == sf::Event::Closed) {
                window.close();
            }
            else if(event.type == sf::Event::Resized) {
                sf::FloatRect visibleArea(0, 0, event.size.width, event.size.height);
                window.setView(sf::View(visibleArea));
            }
        }

        window.clear(bgColor);
        window.display();
    }

    return 0;
}