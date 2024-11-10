extends Node2D

@export var sceneToOpenPath: String
@export var fade: BlackFade

func _ready():
	$Clickable.connect("mouse_clicked_on_object", _start_fading_out)
	get_parent().get_node("0PotDry").hide()


func _start_fading_out() -> void:
	fade.fade_to_black()
	fade.connect("fade_out_finished", change_scene)

func change_scene() -> void:
	get_tree().change_scene_to_file(sceneToOpenPath)
