extends Sprite2D

@export var on: Texture2D
@export var off: Texture2D


func _ready() -> void:
	texture = off
	$LightSwitchClickable.connect("mouse_clicked_on_object", _switch)
	
	
func _switch():
	texture = on
	await get_tree().create_timer(0.5).timeout
	texture = off
