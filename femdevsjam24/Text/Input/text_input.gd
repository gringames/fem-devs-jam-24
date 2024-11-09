extends Control
class_name TextInput

var text_edit: TextEdit
var send_button: Button

signal sent_hope


func _ready() -> void:
	text_edit = $TextEdit
	send_button = $SendButton
	send_button.connect("pressed", _submit_text)

# TODO: in progress check if text is empty and activate button depending on that

func _process(delta: float) -> void:
	send_button.disabled = text_edit.text.is_empty()
	

func _submit_text() -> void:
	if text_edit.text.is_empty():
		return
	
	emit_signal("sent_hope")
	Hopes.save_player_hope( text_edit.text)
	_clear_text()
	

func _clear_text() -> void:
	text_edit.text = ""
