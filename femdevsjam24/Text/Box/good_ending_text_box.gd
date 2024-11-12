extends Node2D
class_name GoodEndingTextBox

@export var goodFinalBtn1: Button
@export var continueBtn: Button
@export var goodFinalBtn2: Button
@export var badinalBtn: Button

var text_label: RichTextLabel
var name_label: RichTextLabel

var next_button: Button

var current_pages: Array = 	["Anton§Congratulations! I received the report where you confirm the tree is ready to be transplanted outside!",
			"We made it, doctor! We made it! I can't believe it! After all this time! After all the effort!",
			"It took so much out of us. We had to make so many sacrifices. But it's done. It's finally done!",
			"And it was worth it, all of it. For this moment.",
			"...",
			"I can trust you, right? You told me you wouldn't judge me when I was ready to let my regrets out.",
			"I've been keeping this secret for very long. You wouldn't imagine how it has chased me, day and night.?",
			"I need to let it out. Tell someone. I think you will understand it now.",
			"Remember the day Alessandro, Kate and Mila left? I told you they decided to go outside because they realised we wouldn't have supplies to survive.",
			"A sacrifice made in silence so none of you would stop them... Three scientists that will be remembered as heroes...",
	"All lies.",
	"They didn't leave. They never decided to do so. I had to force them.",
	"When they went outside to check on what was left of our first attempt of a forest... I locked them out.",
	"We all knew food wouldn't be enough. Not for everyone. Not until this tree grew.",
	"I mean, even without them, we have been eating nothing but potato salad for the last 30 days!",
	"It would have been impossible to maintain so many people in here. Someone had to make the decision.",
	"You understand it, right? That we deserve this. The recognition.",
	"We are saving what's left of humanity. People like us who did whatever was needed to survive!#",
			]
			
var current_pages2:Array = 	["Anton§Aren't you a hypocrite? You are part of us! Mila, Kate and Alessandro died so you could bring this tree to life!",
	"What about everyone's hopes? Sai's. Mizuki's. All of humanity's. Would you scatter them only because of what we've become?",
	"What about your hope? \"%\" Isn't that what you said?",
	"Are you willing to give all that up?&",
	]
var current_message: String

var counter: int = 0

var separator: String = "§"
var btn1_indicator: String = "#"
var btn2_indicator: String = "&"

var current_button: Button


func _ready() -> void:
	text_label = $DialogueBox/Message
	name_label = $DialogueBox/Name
	
	next_button = $DialogueBox/NextButton
	next_button.connect("pressed", _next_page)
	
	goodFinalBtn1.connect("pressed", gotoGoodFinal)
	continueBtn.connect("pressed", contBt)
	goodFinalBtn2.connect("pressed", gotoGoodFinal)
	badinalBtn.connect("pressed", gotoBadFinal)
	
	set_pages(current_pages)
	appear()
	
	EndingPlantState.final_plant_state = Plants.States.Blossom


# PAGES --------------------------------------------------------------------------------------------

func set_pages(pages: Array) -> void:
	if pages.is_empty():
		return
	
	counter = 0
	
	current_pages = pages
	current_message = str(current_pages[0])
	
	next_button.show()
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
		
	current_message = current_pages[counter]
		
	if current_message.contains("%"):
		current_message = current_message.replace("%", Hopes.player_hope)
	
	if current_message.contains(btn1_indicator):
		current_message = current_message.replace(btn1_indicator, "")
		goodFinalBtn1.show()
		continueBtn.show()
		next_button.hide()
	
	if current_message.contains(btn2_indicator):
		current_message = current_message.replace(btn2_indicator, "")
		goodFinalBtn2.show()
		badinalBtn.show()
		next_button.hide()
		
	var split: Array = _split_name_and_message(current_message)
	
	if split.size() <= 1:
		_set_text(current_message)
	else:
		_set_npc_name(str(split[0]))
		_set_text(str(split[1]))
	
	counter += 1
	

func contBt():
	next_button.show()
	set_pages(current_pages2)
	goodFinalBtn1.hide()
	continueBtn.hide()
	
func gotoGoodFinal():
	get_tree().change_scene_to_file("res://Endings/good_final_ending.tscn")

func gotoBadFinal():
	get_tree().change_scene_to_file("res://Endings/bad_final_ending.tscn")
	
func _split_name_and_message(line: String) -> Array:
	var split = [line]

	if line.contains(separator): 
		split = line.split(separator, true, 1)
		
	return split
	
func _close() -> void:
	get_tree().change_scene_to_file("res://Endings/bad_final_ending.tscn")
