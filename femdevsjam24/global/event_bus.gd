extends Node

signal mouse_clicked
signal mouse_released

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		emit_signal("mouse_clicked")
		
	if Input.is_action_just_released("click"):
		emit_signal("mouse_released")
