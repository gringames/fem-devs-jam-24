extends Node
class_name GameManager

@export var text_box: TextBox
@export var text_input: TextInput

@export var button_show_box: Button
@export var button_hide_box: Button
@export var button_show_input: Button
@export var button_hide_input: Button

var box_shown: bool = false;
var input_shown: bool = false;


func _ready() -> void:
	_hide_box()
	_hide_input()
	
	button_show_box.connect("pressed", _show_box)
	button_hide_box.connect("pressed", _hide_box)
	button_show_input.connect("pressed", _show_input)
	button_hide_input.connect("pressed", _hide_input)


func _show_box() -> void:
	if input_shown:
		_hide_input()
	text_box.show()
	box_shown = true

func _hide_box() -> void:
	text_box.hide()
	box_shown = false

	
func _show_input() -> void:
	if box_shown:
		_hide_box()
	text_input.show()
	input_shown = true

func _hide_input() -> void:
	text_input.hide()
	input_shown = false
