extends Node
class_name DayManager

@export var next_day_button: Button
@export var phone_call_text_box: TextBox
@export var task_list: TaskList

# TODO: add things from Rocio and Tilli here
var day_info: Dictionary = {
	0 : {
		"tasks": ["plant the seed"],
		"calls": [],
		"newspaper": "none"
	},
	1 :
		{
		"tasks":
			[
			"water the seed",
			"look around"
			],
		"calls": 
			[
			"Anton§Hey, Anton Hopper here. Just making the routine check-up call.",
			"The tree hasn't died yet, has it? That's great news. Sorry if I am a bit nervous about this. We need to make it work.",
			"Anyway, let's go over your duties real quick. I need to get out to fix the damn vents that broke yesterday.",
			"Keep the tree alive. I don't need to remind you this one, right?",
			"Check your notepad if you aren't sure of what it needs.",
			"Also, Sai said he would leave the newspaper on your desk when it arrives.",
			"We receive it monthly. Not much we can do about it with how things are outside.",
			"Lastly, when you are finished, for the love of God, do not forget to turn the lights off. We have NO energy to waste.",
			"I have to go now. I hope this turns out right...",
			"We've been talking about during breakfast, you know? Hopes.",
			"They all rely on what we're doing here, buddy. Keep tight."
			],
		"newspaper":
			[
			"03-07-2084",
			"Flooding in Venice leaves bodies on the streets.",
			"The local police is trying to identify as many corpses as possible, and all citizens are encouraged to abandon their houses. The body of a dead dolphin has also been found in Saint Mark's Square, an animal that was believed to had extinted 20 years ago."
			]
		},
	2 : 
		{
		"tasks": [],
		"calls": ["NPC2§pae1", "padge 2"],
		"newspaper": ["1.1.23", "title", "content"]
		},
	3 : {
		"tasks": [],
		"calls": [],
		"newspaper": ["1.1.23", "title", "content"]
	},
	4 : {
		"tasks": [],
		"calls": [],
		"newspaper": ["1.1.23", "title", "content"]
	},
	5 : {
		"tasks": [],
		"calls": [],
		"newspaper": ["1.1.23", "title", "content"]
	},
	6 : {
		"tasks": [],
		"calls": [],
		"newspaper": ["1.1.23", "title", "content"]
	},
	7 : {
		"tasks": [],
		"calls": [],
		"newspaper": ["1.1.23", "title", "content"]
	}
}

var current_day: int = 0
const tasks_key: String = "tasks"
const calls_key: String = "calls"


func _ready() -> void:
	next_day_button.connect("pressed", _next_day)


func _next_day() -> void:
	print("current day: ", current_day)	
	_handle_day()
	current_day += 1


func _handle_day() -> void:
	var current_calls: Array = day_info[current_day][calls_key]
	var current_tasks: Array = day_info[current_day][tasks_key]
	
	if _is_call_happening_today(current_calls):
		_set_up_phone_call(current_calls)
		
	_set_up_task_list(current_tasks)


func _is_call_happening_today(calls: Array) -> bool:
	return not calls.is_empty()
	

func _set_up_phone_call(content) -> void:
	print("RINGGGG, RINGGG")
	phone_call_text_box.disappear()
	phone_call_text_box.set_pages(content)



func _set_up_task_list(content) -> void:
	task_list.disappear()
	var checklist: String = _create_tasks_checklist(content)
	task_list.set_text(checklist)

func _create_tasks_checklist(tasks: Array) -> String:
	if tasks.is_empty():
		return "No tasks today."
	
	var checklist: String = "Tasks for today:\n"
	var task_counter: int = 1
	
	for task in tasks:
		checklist +=  "\t" + str(task_counter) + ") " + str(task) + "\n"
		task_counter += 1
	return checklist
