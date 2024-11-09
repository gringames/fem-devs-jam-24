extends Node
class_name DayManager

## will be an object in game scene -> set up all information needed for days

var day_info: Dictionary = {
	0 : {
		"tasks": ["plant the seed"],
		"calls": [],
	},
	1 : {
		"tasks": ["water the seed", "look around"],
		"calls": ["Good Morning. WElcome to the bunkeer"],
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

func _ready() -> void:
	_next_day()
	_next_day()


func _next_day() -> void:
	print("current day: ", current_day)	
	_process_tasks_and_calls()
	current_day += 1


func _process_tasks_and_calls() -> void:
	if day_info[current_day]["calls"].is_empty():
		print("no calls today")
	else:
		print("calls:", day_info[current_day]["calls"])
		
	if day_info[current_day]["tasks"].is_empty():
		print("no tasks today")
	else:
		print("tasks:", day_info[current_day]["tasks"])
