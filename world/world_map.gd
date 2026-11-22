class_name WorldMap

var provinces_id: Dictionary = {}
var provinces_coordinates: Dictionary = {}

func add_province(province: Province) -> void:
	provinces_id[province.id] = province
	provinces_coordinates[province.axial_coordinates] = province
func get_by_id(id: int) -> Province:
	return provinces_id.get(id)
func get_by_coordinates(coordinate: Vector2i) -> Province:
	return provinces_coordinates.get(coordinate)
func get_all_provinces() -> Array:
	return provinces_id.values()
