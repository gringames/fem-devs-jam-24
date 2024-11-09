extends Node2D
class_name Plant

@export_category("{Pot,Seed, Sapling, Little, Medium, Big, Blossom,	Withered}")
@export var plant_state_images: Array[Texture2D]

signal clicked_plant

var clickable: Clickable
var plant_state: Plants.States = Plants.States.Pot
var plant_visual: Sprite2D

func _ready() -> void:
	plant_visual = $PlantVisual
	clickable = $Clickable
	clickable.connect("mouse_clicked_on_object", _on_clicked)
	

func _on_clicked() -> void:
	emit_signal("clicked_plant")


func grow() -> void:
	plant_state += 1
	_update_visual()


func wither() -> void:
	plant_state = Plants.States.Withered
	_update_visual()


func _update_visual() -> void:
	if plant_state >= plant_state_images.size():
		return
	plant_visual.texture = plant_state_images[plant_state]
