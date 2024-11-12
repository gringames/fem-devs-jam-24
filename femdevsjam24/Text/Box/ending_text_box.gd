extends Node2D
class_name EndingTextBox


var text_label: RichTextLabel
var name_label: RichTextLabel

var next_button: Button
var close_button: Button

var current_pages: Array = 	["Anton§I can see the tree from my monitor right now! Why is it like this? What happened!?",
			"WHAT HAVE YOU DONE!?",
			"You didn't take care of it properly, did you?",
			"You let it die, and all the sacrifices we made with it!",
			"Kate, Alessandro and Mila... You think they left so we would have enough supplies? You think they are out there, living their lives like nothing happened?",
			"They are dead! I killed them! I locked them out when they went to check on our first attempt of a forest!",
			"We didn't have enough food for everyone to survive, for us to take care of this tree until it was fully grown.",
			"Someone had to make the decision. I made it for all of us! AND FOR WHAT?!",
			"You let it die! You let all of our hopes die!",
			"\"%\" Isn't that what you said?!",
	"What now!? Your words will be no more than dust in the wind! Why would you do this!?",
			]
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
	
	EndingPlantState.final_plant_state = Plants.States.Withered
	


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
	
	if current_message.contains("%"):
		current_message = current_message.replace("%", Hopes.player_hope)
	
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
