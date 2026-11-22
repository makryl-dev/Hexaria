class_name  MapGenerator
var land = "res://terrain_type/land.tres"
var water = "res://terrain_type/water.tres"

func generate_world() -> WorldMap:
	var map := WorldMap.new()
	
	var layout: Dictionary = {
		Vector2i(0, 0): land,
		Vector2i(1, 0): land,
		Vector2i(0, 1): land,
		Vector2i(-1, 1): land,

		Vector2i(-1, 0): water,
		Vector2i(1, -1): water,
		Vector2i(0, -1): water,
		Vector2i(2, 0): water,
		Vector2i(1, 1): water,
		Vector2i(0, 2): water,
		Vector2i(-1, 2): water,
		Vector2i(-2, 1): water,
		Vector2i(-2, 0): water,
	}
	
	var id: int = 0
	for coordinates: Vector2i in layout:
		var province := Province.new()
		province.id = id
		province.axial_coordinates = coordinates
		province.terrain_type = layout[coordinates]
		map.add_province(province)
		id += 1
	return map
