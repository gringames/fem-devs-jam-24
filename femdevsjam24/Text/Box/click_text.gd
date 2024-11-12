extends Control
class_name Final

@export_category("Fade")
@export var fade: BlackFade

@export_category("Final TextBox Text")
@export var texts: Array = ["You made your choice.", "v"]

@export_category("Plant Visual")
@export var plant_visual_blossom: Texture2D
@export var plant_visual_withered: Texture2D
@export var plant_visual: Sprite2D
@export var pot_dry: Texture2D
@export var pot_wet: Texture2D
@export var pot_visual: Sprite2D


var index: int = 0
var label: RichTextLabel



func _ready() -> void:
	label = $CanvasLayer/CenterContainer/RichTextLabel
	label.hide()
	label.text = texts[index]
	_prepare_plant_visuals()
	

# plant visual has to be same as in ending before
func _prepare_plant_visuals() -> void:
	if EndingPlantState.final_plant_state == Plants.States.Withered:
		plant_visual.texture = plant_visual_withered
		pot_visual.texture = pot_dry
	else:
		plant_visual.texture = plant_visual_blossom
		pot_visual.texture = pot_wet
				

func start() -> void:
	EventBus.connect("mouse_clicked", _next)
	label.show()
	_next()


func _next() -> void:
	if index == texts.size():
		fade.fade_to_black()
		await fade.fade_out_finished
		get_tree().change_scene_to_file("res://menus/credits.tscn")
		return
	
	label.text = "[b][center]" + texts[index]
	index += 1
