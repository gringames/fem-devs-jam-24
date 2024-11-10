extends Control
class_name Final

@export var texts: Array = ["You made your choice.", "v"]
var index: int = 0

var label: RichTextLabel

func _ready() -> void:
	label = $RichTextLabel
	label.text = texts[index]


func start() -> void:
	EventBus.connect("mouse_clicked", _next)
	_next()


func _next() -> void:
	if index == texts.size():
		get_tree().change_scene_to_file("res://menus/main_menu.tscn")
		return
	
	label.text = texts[index]
	index += 1
