extends Camera2D

var target_zoom: float = 1.0
const MIN_ZOOM: float = 0.35
const MAX_ZOOM: float = 2.5
const ZOOM_FACTOR: float = 0.095
const ZOOM_RATE: float = 15.0

func zoom_in() -> void:
	var step: float = target_zoom * ZOOM_FACTOR
	target_zoom = max(target_zoom - step, MIN_ZOOM)
	set_physics_process(true)

func zoom_out() -> void:
	var step: float = target_zoom * ZOOM_FACTOR
	target_zoom = min(target_zoom + step, MAX_ZOOM)
	set_physics_process(true)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE:
			position -= event.relative / zoom
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_out()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_in()

func _physics_process(delta: float) -> void:
	var prev_zoom: Vector2 = zoom
	var mouse_before: Vector2 = get_global_mouse_position()
	zoom = lerp(
		zoom,
		target_zoom * Vector2.ONE,
		ZOOM_RATE * delta
	)
	if zoom.x > prev_zoom.x:
		position += mouse_before - get_global_mouse_position()
	set_physics_process(
		not is_equal_approx(zoom.x, target_zoom)
	)
