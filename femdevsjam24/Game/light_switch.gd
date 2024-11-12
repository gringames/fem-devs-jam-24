extends Sprite2D
class_name LightSwitch

@export var on: Texture2D
@export var off: Texture2D


func _ready() -> void:
	switch_on()
	$LightSwitchClickable.connect("mouse_clicked_on_object", switch_off)
	
	
func switch_on():
	texture = on

func switch_off():
	texture = off
