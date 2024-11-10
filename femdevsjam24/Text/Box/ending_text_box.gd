extends Node2D
class_name EndingTextBox


var text_label: RichTextLabel
var name_label: RichTextLabel

var next_button: Button
var close_button: Button

var current_pages: Array = ["1", "2"]
var current_message: String

var counter: int = 0

var separator: String = "§"
var input_indicator: String = "%"

var current_button: Button


func _ready() -> void:
	text_label = $DialogueBox/Message
	name_label = $DialogueBox/Name
	
	next_button = $DialogueBox/NextButton
	close_button = $DialogueBox/ENDINGbtn
	
	next_button.hide()
	close_button.hide()
	
	next_button.connect("pressed", _next_page)
	close_button.connect("pressed", _close)
	
	set_pages(current_pages)
	appear()
	


# PAGES --------------------------------------------------------------------------------------------

func set_pages(pages: Array) -> void:
	if pages.is_empty():
		return
	
	counter = 0
	
	current_pages = pages
	current_message = str(current_pages[0])
	
	next_button.show()
	close_button.hide()
	_next_page()


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
	show()
	
	
func disappear() -> void:
	hide()


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
	
	var split: Array = _split_name_and_message(current_message)
	
	if split.size() <= 1:
		_set_text(current_message)
	else:
		_set_npc_name(str(split[0]))
		_set_text(str(split[1]))
	
	counter += 1
	
	
	
func _split_name_and_message(line: String) -> Array:
	var split = [line]

	if line.contains(separator): 
		split = line.split(separator, true, 1)
		
	return split
	
func _close() -> void:
	get_tree().change_scene_to_file("res://Endings/bad_final_ending.tscn")
