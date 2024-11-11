extends Node2D

@export var sceneToOpenPath: String
@export var fade: BlackFade

var plantSFX: AudioStreamPlayer

func _ready():
	$Clickable.connect("mouse_clicked_on_object", _start_fading_out)
	get_parent().get_node("0PotDry").hide()
	plantSFX = $PlantSFX


func _start_fading_out() -> void:
	plantSFX.play()
	fade.fade_to_black()
	fade.connect("fade_out_finished", change_scene)

func change_scene() -> void:
	get_tree().change_scene_to_file(sceneToOpenPath)
