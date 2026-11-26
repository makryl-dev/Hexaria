class_name GameCalendar
extends Node

signal week_passed
signal month_passed
signal year_passed

@export var day: int = 1
@export var month: int = 1
@export var year: int = 1

var _day_counter_for_week: int = 0

func _is_leap_year(_year: int) -> bool:
	return (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)
func _get_days_in_month(_month: int, _year: int) -> int:
	match _month:
		1, 3, 5, 7, 8, 10, 12:
			return 31
		4, 6, 9, 11:
			return 30
		2:
			return 29 if _is_leap_year(_year) else 28
		_:
			push_error("Invalid month: %d" % _month)
			return 30

func _on_simulation_clock_tick() -> void:
	day += 1
	_day_counter_for_week += 1
	
	var days_in_current_month := _get_days_in_month(month, year)
	
	if day > days_in_current_month:
		day = 1
		month += 1
		month_passed.emit()
		if month > 12:
			month = 1
			year += 1
			year_passed.emit()
	if _day_counter_for_week >= 7:
		_day_counter_for_week = 0
		week_passed.emit()
