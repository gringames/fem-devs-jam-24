extends Node2D
class_name Flicker

@export var flicker_interval_min: float = 3
@export var flicker_interval_max: float = 8
@export var flicker_duration: float = 0.08
@export var flicker_pause: float = 0.23
@export var flicker_speed: float = 4

var flicker_sfx: AudioStreamPlayer
var fade: BlackFade


func _ready() -> void:
	flicker_sfx = $flickerSFX
	fade = $BlackFadeCanvasLayer
	fade.fade_speed = flicker_speed
	await get_tree().create_timer(_get_random_in_interval()).timeout
	_flicker_two_times()
	
	
func _flicker_two_times() -> void:
	flicker_sfx.play()
	_flicker()
	await get_tree().create_timer(flicker_pause).timeout
	_flicker()
	# wait a random amount of time and then trigger the flicker again
	await get_tree().create_timer(_get_random_in_interval()).timeout
	_flicker_two_times()

# what a mess
func _flicker() -> void:
	fade.fade_to_black()
	await get_tree().create_timer(flicker_duration).timeout
	fade.fade_from_black()


func _get_random_in_interval() -> float:
	return randf_range(flicker_interval_min, flicker_interval_max)
