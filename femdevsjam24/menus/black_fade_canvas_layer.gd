extends CanvasLayer
class_name BlackFade

var black_rect: ColorRect

@export var fade_speed: float = 2
@export var auto_start: bool = false

var fade_to: bool = false
var fade_from: bool = false

signal fade_in_finished
signal fade_out_finished


func _ready() -> void:
	black_rect = $ColorRect
	black_rect.color.a = 0
	if auto_start:
		fade_from_black()
	

func fade_to_black() -> void:
	black_rect = $ColorRect
	black_rect.color.a = 0
	fade_to = true
	fade_from = false
	

func fade_from_black() -> void:
	black_rect = $ColorRect
	black_rect.color.a = 1
	fade_to = false
	fade_from = true
	


func _process(delta: float) -> void:
	if fade_to:
		black_rect.color.a += fade_speed * delta
		if black_rect.color.a >= 1:
			black_rect.color.a = 1
			fade_to = false
			emit_signal("fade_out_finished")
			
	if fade_from:
		black_rect.color.a -= fade_speed * delta
		if black_rect.color.a <= 0:
			black_rect.color.a = 0
			fade_from = false
			emit_signal("fade_in_finished")
