extends Button
class_name OpenScene

@export var sceneToOpenPath: String

func _ready():
	self.connect("pressed", change_scene)


func change_scene():
	# via path allows for jumping back and forth between scenes
	get_tree().change_scene_to_file(sceneToOpenPath)
