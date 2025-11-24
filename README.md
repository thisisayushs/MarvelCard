# MarvelCard

![Banner](MarvelCardBanner.png)

Marvel Card Experiment is a UI experiment built entirely in SwiftUI, inspired by Ryan Kopinsky’s video about recreating a Pokémon card using declarative UI. Instead of recreating the same idea, this project takes the concept in a new direction by rebuilding a full Marvel Captain America trading card from scratch, both front and back, using SwiftUI’s drawing and layout tools.

The goal was simple: see how far SwiftUI can go when treated like a pure rendering engine.
Apart from a few character images, every part of the card is constructed using Shapes, Stacks, Lines, Gradients, ZStacks, Colors, and SwiftUI’s built-in layout primitives. The borders, comic-book accents, typography, layered frames, and even the paper-like depth on the back side are all programmatically drawn.

SwiftUI’s image tools made it easy to precisely position character art, align frames, mask edges, and preserve the retro printed-card style. The result is a playful but technically detailed representation of a real trading card.

The card flips between the front and back with a smooth interactive animation, and to push the idea further, the entire card responds to the iPhone’s gyroscope through CoreMotion. This subtle tilt effect adds depth, personality, and physicality, making the card feel like an object rather than a static view.

This experiment highlights just how expressive SwiftUI can be when pushed creatively from building a complete two-sided layout to animating fluid transitions and integrating real-time sensor data.
