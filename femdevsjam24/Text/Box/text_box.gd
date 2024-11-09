extends Node2D
class_name TextBox


@export var visible_by_default: bool = false

var text_label: RichTextLabel
var name_label: RichTextLabel

var next_button: Button
var close_button: Button

var current_pages: Array
var current_message: String

var counter: int = 0


func _ready() -> void:
	text_label = $DialogueBox/Message
	name_label = $DialogueBox/Name
	
	next_button = $DialogueBox/NextButton
	close_button = $DialogueBox/CloseButton
	
	next_button.hide()
	close_button.hide()
	
	next_button.connect("pressed", _next_page)
	close_button.connect("pressed", _close)
	
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
	_next_page()


# MESSAGE ------------------------------------------------------------------------------------------

func _set_text(text: String) -> void:
	text_label.text = text;
	

func clear_text() -> void:
	_set_text("")


# NAME ---------------------------------------------------------------------------------------------

func set_npc_name(npc_name: String) -> void:
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
	
	if counter == current_pages.size() - 1:
		next_button.hide()
		close_button.show()
		
	current_message = current_pages[counter]
	_set_text(current_message)
	
	counter += 1
	
	
func _close() -> void:
	clear_text()
	disappear()
