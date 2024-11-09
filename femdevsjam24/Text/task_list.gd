extends Node2D
class_name TaskList

var text_label: RichTextLabel
var close_button: Button

func _ready() -> void:
	text_label = $DialogueBox/Message
	close_button = $DialogueBox/CloseButton
	close_button.connect("pressed", disappear)
	
	disappear()
	
	
func appear() -> void:
	show()
	
	
func disappear() -> void:
	hide()
	


func set_text(text: String) -> void:
	text_label.text = text;
	

func _clear_text() -> void:
	set_text("")


func _close() -> void:
	disappear()
	_clear_text()
