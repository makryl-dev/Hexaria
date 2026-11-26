class_name  MapGenerator
var _terrain_types: Dictionary = {
	"p" : preload("res://terrain_type/plains.tres"),
	"f" : preload("res://terrain_type/forest.tres"),
	"m" : preload("res://terrain_type/mountains.tres"),
	"sp" : preload("res://terrain_type/snowy_plains.tres"),
	"sf" : preload("res://terrain_type/snowy_forest.tres"),
	"sm" : preload("res://terrain_type/snowy_mountains.tres"),
	"d" : preload("res://terrain_type/desert.tres"),
	"j" : preload("res://terrain_type/jungle.tres"),
	"dm" : preload("res://terrain_type/deserted_mountains.tres"),
	"ws" : preload("res://terrain_type/water_shallow.tres"),
	"wm" : preload("res://terrain_type/water_medium.tres"),
	"wd" : preload("res://terrain_type/water_deep.tres"),
}

func generate_world() -> WorldMap:
	var map := WorldMap.new()
	
	var layout: Dictionary = {
		Vector2i(0,0) : _terrain_types['p']
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
