extends Node2D
class_name Flicker

@export var flicker_interval_min: float = 3
@export var flicker_interval_max: float = 8
@export var flicker_duration: float = 0.08
@export var flicker_speed: float = 4

var fade: BlackFade


func _ready() -> void:
	fade = $BlackFadeCanvasLayer
	fade.fade_speed = flicker_speed
	await get_tree().create_timer(_get_random_in_interval()).timeout
	_flicker()
	

func _flicker() -> void:
	fade.fade_to_black()
	await get_tree().create_timer(flicker_duration).timeout
	fade.fade_from_black()
	fade.fade_from_black()
	await get_tree().create_timer(_get_random_in_interval()).timeout
	_flicker()


func _get_random_in_interval() -> float:
	return randf_range(flicker_interval_min, flicker_interval_max)
