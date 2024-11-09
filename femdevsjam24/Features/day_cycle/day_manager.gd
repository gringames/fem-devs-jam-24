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
	1 : {
		"tasks": ["water the seed", "look around"],
		"calls": ["NPC1§Good Morning. Welcome to the bunkeer", "page 2"],
		"newspaper": ["1.1.23", "title", "content"]
	},
	2 : {
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
