#include <SFML/Graphics.hpp>
#include <imgui/imgui-SFML.h>
#include <imgui/imgui.h>
#include <iostream>

int main() {
    sf::VideoMode desktop = sf::VideoMode::getDesktopMode();
    unsigned int windowWidth = desktop.width * 0.9;
    unsigned int windowHeight = desktop.height * 0.80;

    sf::RenderWindow window(sf::VideoMode(windowWidth, windowHeight), "Acorn");

    if (!ImGui::SFML::Init(window)) {
        std::cerr << "Failed to initialize ImGui-SFML." << std::endl;
        return -1;
    }

    window.setFramerateLimit(60);

    sf::Clock deltaClock;
    sf::Color bgColor(0x1d, 0x1d, 0x1d);

    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            ImGui::SFML::ProcessEvent(event);

            if (event.type == sf::Event::Closed) {
                window.close();
            }
            else if (event.type == sf::Event::Resized) {
                sf::FloatRect visibleArea(0, 0, event.size.width, event.size.height);
                window.setView(sf::View(visibleArea));
            }
        }

        ImGui::SFML::Update(window, deltaClock.restart());

        ImGui::Begin("Hello, ImGui!");
        ImGui::Text("Some text..");
        ImGui::End();

        window.clear(bgColor);
        ImGui::SFML::Render(window);
        window.display();
    }

    return 0;
}