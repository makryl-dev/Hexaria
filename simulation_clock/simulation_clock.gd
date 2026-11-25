class_name SimulationClock
extends Node

signal tick

var is_paused: bool = true
var speed_multiplier: float = 1.0
var tick_interval: float = 1.0
var accumulator: float = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("time_pause"):
		is_paused = not is_paused
	if Input.is_action_just_pressed("time_set_speed_1"):
		speed_multiplier = 1.0
	if Input.is_action_just_pressed("time_set_speed_2"):
		speed_multiplier = 2.0
	if Input.is_action_just_pressed("time_set_speed_3"):
		speed_multiplier = 3.0

	if is_paused:
		return
	
	accumulator += min(delta, 0.1) * speed_multiplier
	while  accumulator >= tick_interval:
		accumulator -= tick_interval
		tick.emit()
