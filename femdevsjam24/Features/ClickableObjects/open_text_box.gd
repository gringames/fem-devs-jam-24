extends Node2D

@export var text_box: TextBox

var clickable: Clickable

func _ready() -> void:
	clickable = $Phone/Clickable
	clickable.connect("mouse_clicked_on_object", _show_text_box)


func _show_text_box() -> void:
	text_box.appear()
