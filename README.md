# Hexaria

> **Notice:** This `README.md` and the repository **About** description were **100% written by AI** due to the very early stage of development and frequent, rapid changes across the codebase.

An early-stage strategy game prototype built in **Godot**, designed to combine elements of **Grand Strategy**, **RTS**, and **4X**. Developed by a single person as a first video game and a hands-on learning project.

## Current Status

The project is in active early prototyping with core foundational systems taking shape:

- **World & Map Generation:** Data structures for the world map (`world_map.gd`), map generation (`map_generator.gd`), and rendering to a tile map layer (`world_renderer.gd`) inside the main world scene (`world.tscn`).
- **Terrain Types:** Custom resource definitions (`terrain_type.gd`) with atlas coordinates, water flags, and base growth rates, covering `desert`, `deserted_mountains`, `forest`, `jungle`, `mountains`, `plains`, `snowy_forest`, `snowy_mountains`, `snowy_plains`, `water_deep`, `water_medium`, and `water_shallow`.
- **Provinces:** Province resource (`province.gd`) expanded with population, economy, development, and infrastructure properties.
- **Simulation Clock & Calendar:** Simulation clock (`simulation_clock.gd`), game calendar (`game_calendar.gd`) tracking in-game days, months, years, and periodic signals, alongside input actions for pausing and changing game speed.
- **Camera:** Panning and zooming camera (`camera.tscn` / `camera.gd`) driven via Input Map actions.

## Project Structure

```text
.
├── assets/             # Sprite atlas and imported assets (terrain_types.png)
├── camera/             # Camera scene and movement/zoom controller
├── province/           # Province resource definitions
├── simulation_clock/   # Time simulation, calendar logic, and signals
├── terrain_type/       # Terrain resource script and .tres terrain definitions
├── world/              # World scene, map data, generator, and renderer
└── project.godot       # Godot project configuration
