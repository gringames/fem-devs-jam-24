extends Node2D
class_name TextBox

var text_label: RichTextLabel


func _ready() -> void:
	text_label = $TextureRect/RichTextLabel


func _process(delta: float) -> void:
	pass


func set_text(text: String) -> void:
	text_label.text = text;
	

func clear_text() -> void:
	set_text("")



func _appear() -> void:
	pass
	
	
func _disappear() -> void:
	pass
