extends Control
class_name TextInput

var text_edit: TextEdit
var send_button: Button


func _ready() -> void:
	text_edit = $TextEdit
	send_button = $SendButton
	send_button.connect("pressed", _submit_text)

func _submit_text() -> void:
	Hopes.add_hope( text_edit.text)
	# Hopes.print_hopes()
	_clear_text()
	

func _clear_text() -> void:
	text_edit.text = ""
