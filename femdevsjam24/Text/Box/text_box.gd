extends Node2D
class_name TextBox

signal on_close

@export var visible_by_default: bool = false
@export var blibs: Array[AudioStream]

var text_label: RichTextLabel
var name_label: RichTextLabel

var next_button: Button
var close_button: Button

var input_field: TextInput
var dialogue_sfx: AudioStreamPlayer

var current_pages: Array
var current_message: String

var counter: int = 0

var separator: String = "§"
var input_indicator: String = "%"

var current_button: Button
var open: bool = true


func _ready() -> void:
	text_label = $DialogueBox/Message
	name_label = $DialogueBox/Name
	
	next_button = $DialogueBox/NextButton
	close_button = $DialogueBox/CloseButton
	
	next_button.hide()
	close_button.hide()
	
	next_button.connect("pressed", _next_page)
	close_button.connect("pressed", _close)
	
	input_field = $DialogueBox/TextInput
	input_field.hide()
	
	dialogue_sfx = $DialogueSFX
	
	if not visible_by_default:
		disappear()


# PAGES --------------------------------------------------------------------------------------------

func set_pages(pages: Array) -> void:
	if pages.is_empty():
		return
	
	counter = 0
	
	current_pages = pages
	current_message = str(current_pages[0])
	
	next_button.show()
	close_button.hide()


# MESSAGE ------------------------------------------------------------------------------------------

func _set_text(text: String) -> void:
	text_label.text = text;
	

func clear_text() -> void:
	_set_text("")


# NAME ---------------------------------------------------------------------------------------------

func _set_npc_name(npc_name: String) -> void:
	name_label.text = "[b]" + npc_name + "[/b]"


# BOX ----------------------------------------------------------------------------------------------

func appear() -> void:
	_next_page()
	show()
	_restart_dialogue_sfx()
	open = true
	
	
func disappear() -> void:
	dialogue_sfx.stop()
	hide()
	open = false


# BUTTONS ------------------------------------------------------------------------------------------

func _next_page() -> void:	
	if counter >= current_pages.size():
		return
		
	current_button = next_button
	
	if counter == current_pages.size() - 1:
		next_button.hide()
		close_button.show()
		current_button = close_button
		
	current_message = current_pages[counter]
	
	if current_message.contains(input_indicator):
		current_message = current_message.left(current_message.length() - 1)
		input_field.show()
		current_button.disabled = true
		input_field.connect("sent_hope", _on_sent_hope)
	
	var split: Array = _split_name_and_message(current_message)
	
	if split.size() <= 1:
		_set_text(current_message)
	else:
		_set_npc_name(str(split[0]))
		_set_text(str(split[1]))
	
	counter += 1
	_restart_dialogue_sfx()
	
	
func _split_name_and_message(line: String) -> Array:
	var split = [line]

	if line.contains(separator): 
		split = line.split(separator, true, 1)
		
	return split
	
	
func _close() -> void:
	disappear()
	clear_text()
	emit_signal("on_close")


func _on_sent_hope() -> void:
	current_button.disabled = false
	input_field.hide()
	

func _restart_dialogue_sfx() -> void:
	dialogue_sfx.stop()
	dialogue_sfx.play()
	_change_pitch_repeatedly()
	await get_tree().create_timer(randf_range(1.8, 2.5)).timeout
	dialogue_sfx.stop()
	
func _change_pitch_repeatedly() -> void:
	if not open:
		return
	dialogue_sfx.pitch_scale = randf_range(0.95, 1.05)
	await get_tree().create_timer(randf_range(0.2, 0.6)).timeout
	_change_pitch_repeatedly()
