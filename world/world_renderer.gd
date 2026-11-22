class_name  WorldRenderer
extends Node

@export var terrain_layer: TileMapLayer
@export var atlas_source_id: int = 0

func render_map(world_map: WorldMap) -> void:
	if terrain_layer == null or world_map == null:
		return
	terrain_layer.clear()
	for province: Province in world_map.get_all_provinces():
		if province.terrain_type == null:
			continue
		terrain_layer.set_cell(
			province.axial_coordinates,
			atlas_source_id,
			province.terrain_type.atlas_coordinates
		)
