extends Node2D

@export_category("{Pot,Seed, Sapling, Little, Medium, Big, Blossom,	Withered}")
@export var plant_state_images: Array[Texture2D]

var clickable: Clickable
var plant_state: Plants.States = Plants.States.Pot
var plant_visual: Sprite2D

func _ready() -> void:
	plant_visual = $PlantVisual
	clickable = $Clickable
	clickable.connect("mouse_clicked_on_object", _on_clicked)
	
	update_visual()


func _on_clicked() -> void:
	print("plant was clicked")
	# TODO:make task be executed
	plant_state += 1
	update_visual()

func update_visual() -> void:
	if plant_state >= plant_state_images.size():
		return
	plant_visual.texture = plant_state_images[plant_state]
