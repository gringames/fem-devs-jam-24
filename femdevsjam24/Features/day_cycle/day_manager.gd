extends Node
class_name DayManager

@export var next_day_button: Button
@export var phone_call_text_box: TextBox

# TODO: add things from Rocio and Tilli here
var day_info: Dictionary = {
	0 : {
		"tasks": ["plant the seed"],
		"calls": [],
	},
	1 : {
		"tasks": ["water the seed", "look around"],
		"calls": ["Good Morning. WElcome to the bunkeer", "page 2"]
	},
	2 : {
		"tasks": [],
		"calls": [],
	},
	3 : {
		"tasks": [],
		"calls": [],
	},
	4 : {
		"tasks": [],
		"calls": [],
	},
	5 : {
		"tasks": [],
		"calls": [],
	},
	6 : {
		"tasks": [],
		"calls": [],
	},
	7 : {
		"tasks": [],
		"calls": [],
	}
}

var current_day: int = 0
const tasks_key: String = "tasks"
const calls_key: String = "calls"


func _ready() -> void:
	next_day_button.connect("pressed", _next_day)
	_next_day()


func _next_day() -> void:
	print("current day: ", current_day)	
	_handle_day()
	current_day += 1


func _handle_day() -> void:
	var current_calls: Array = day_info[current_day][calls_key]
	var current_tasks: Array = day_info[current_day][tasks_key]
	
	if _is_call_happening_today(current_calls):
		print("RINGGGG, RINGGG")
		phone_call_text_box.set_pages(current_calls)
		phone_call_text_box.appear()
		
	var checklist: String = _create_tasks_checklist(current_tasks)
	print(checklist)
	# TODO: set notebook text box content to checklist


func _is_call_happening_today(calls: Array) -> bool:
	return not calls.is_empty()


func _create_tasks_checklist(tasks: Array) -> String:
	if tasks.is_empty():
		return "No tasks today."
	
	var checklist: String = "Tasks for today:\n"
	var task_counter: int = 1
	
	for task in tasks:
		checklist +=  "\t" + str(task_counter) + ") " + str(task) + "\n"
		task_counter += 1
	return checklist
