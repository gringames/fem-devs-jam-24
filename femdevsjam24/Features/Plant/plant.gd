extends Node2D

var clickable: Clickable

var plant_state: Plants.States = Plants.States.PotSeed


func _ready() -> void:
	clickable = $Clickable
	clickable.connect("mouse_clicked_on_object", _on_clicked)


func _process(delta: float) -> void:
	pass


func _on_clicked() -> void:
	print("plant was clicked")
	# TODO:make task be executed
