extends Button

func _ready() -> void:
	self.connect("pressed", quit)
	
func quit() -> void:
	get_tree().quit()
	return	
