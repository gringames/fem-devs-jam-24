extends Node2D

@export var text_box: TextBox

var end_lines: Array = [""]

func _ready() -> void:
	text_box.connect("on_close", final_lines)
	text_box.set_pages(end_lines)
	text_box.appear() # TODO: wait on fade for this

func final_lines():
	pass
