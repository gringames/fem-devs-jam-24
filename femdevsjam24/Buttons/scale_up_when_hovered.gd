extends Node2D
class_name ScalableButton

@onready var button: Button = get_parent()


func _ready() -> void:
	
	button.connect("mouse_entered", _scale_up)
	button.connect("mouse_exited", _scale_down)

func _scale_up() -> void:
	button.scale *= 1.2

func _scale_down() -> void:
	button.scale /= 1.2
