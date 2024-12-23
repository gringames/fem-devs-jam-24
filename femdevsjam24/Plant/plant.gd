extends Node2D
class_name Plant

@export_category("{Pot,Seed, Sapling, Little, Medium, Big, Blossom,	Withered}")
@export var plant_state_images: Array[Texture2D]
@export var pot_dry: Texture2D
@export var pot_wet: Texture2D
@export var clickables: Array[Clickable]

signal clicked_plant

var clickable: Clickable
var plant_state: Plants.States = Plants.States.Pot
var plant_visual: Sprite2D
var pot_visual: Sprite2D
var sfx: AudioStreamPlayer

func _ready() -> void:
	plant_visual = $PlantVisual
	pot_visual = $PotVisual
	sfx = $WateringSFXPlayer
	clickables[0].connect("mouse_clicked_on_object", _on_clicked)
	clickables[0].show()
	

func _on_clicked() -> void:
	emit_signal("clicked_plant")
	clickables[plant_state].disconnect("mouse_clicked_on_object", _on_clicked)
	clickables[plant_state].hide()
	sfx.play()
	_get_wet()

func _get_wet():
	pot_visual.texture = pot_wet

func get_dry():
	pot_visual.texture = pot_dry
	
	
func grow() -> void:
	plant_state += 1
	_update_visual()
	_update_clickable()


func wither() -> void:
	plant_state = Plants.States.Withered
	_update_visual()
	_update_clickable()


func _update_visual() -> void:
	if plant_state >= plant_state_images.size():
		return
	plant_visual.texture = plant_state_images[plant_state]


func _update_clickable() -> void:
	if plant_state >= clickables.size():
		return
	clickables[plant_state].connect("mouse_clicked_on_object", _on_clicked)
	clickables[plant_state].hide()
	
	
