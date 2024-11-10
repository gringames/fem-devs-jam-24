extends Node2D
class_name Phone

@export var text_box: TextBox

var clickable: Clickable
var audioRing: AudioStreamPlayer
var audioPickUp: AudioStreamPlayer



func _ready() -> void:
	clickable = $Phone/Clickable
	audioRing = $AudioRing
	audioPickUp = $AudioPickUp
	clickable.connect("mouse_clicked_on_object", _on_clicked)


func _on_clicked() -> void:
	text_box.appear()
	_stop_ringing()
	_play_pickup_sound()
	hide()
	

func ring() -> void:
	show()
	_repeatedlyRing()
	
	
func _repeatedlyRing() -> void:
	audioRing.play()
	await audioRing.finished
	ring()
	
	
func _stop_ringing() -> void:
	audioRing.stop()
	

func _play_pickup_sound() -> void:
	audioPickUp.play()
