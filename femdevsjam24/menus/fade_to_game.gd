extends Button

@export var sceneToOpenPath: String
@export var fade: BlackFade

func _ready():
	self.connect("pressed", _start_fading_out)


func _start_fading_out() -> void:
	fade.fade_to_black()
	fade.connect("fade_out_finished", change_scene)

func change_scene() -> void:
	print("change sdene")
	get_tree().change_scene_to_file(sceneToOpenPath)
