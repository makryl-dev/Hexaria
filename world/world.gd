extends Node2D

@onready var renderer: WorldRenderer = $WorldRenderer

var world_map: WorldMap

func  _ready() -> void:
	var generator := MapGenerator.new()
	world_map = generator.generate_world()
	renderer.render_map(world_map)
