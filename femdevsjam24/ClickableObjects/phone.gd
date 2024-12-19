extends Node2D
class_name Phone

@export var text_box: TextBox
@export var shaking_angle: float = 2
@export var shaking_speed: float = 10

var clickable: Clickable
var audioRing: AudioStreamPlayer
var audioPickUp: AudioStreamPlayer
var ringing_phone: Sprite2D
var default_phone: Sprite2D

var do_shake: bool = false
var current_target_angle: float = 0
var elapsed = 0.0

func _ready() -> void:
	clickable = $RingingPhone/Clickable
	audioRing = $AudioRing
	audioPickUp = $AudioPickUp
	clickable.connect("mouse_clicked_on_object", _on_clicked)
	
	ringing_phone = $RingingPhone
	default_phone = $DefaultPhone
	ringing_phone.hide()
	current_target_angle = shaking_angle
	
	text_box.is_phone_box = true;
	
	deactivate()


func _on_clicked() -> void:
	text_box.appear()
	_stop_ringing()
	_stop_shaking()
	_play_pickup_sound()
	deactivate()
	CallOpen.is_phone_box_open = true
	clickable.is_mouse_over = false
	print("removing mouse focus from phone")


func activate() -> void:
	ringing_phone.show()
	default_phone.hide()


func deactivate() -> void:
	ringing_phone.hide()
	default_phone.show()


func ring() -> void:
	_repeatedlyRing()
	_start_shaking()
	
func _repeatedlyRing() -> void:
	audioRing.play()
	await audioRing.finished
	_repeatedlyRing()
	
	
func _stop_ringing() -> void:
	audioRing.stop()
	

func _play_pickup_sound() -> void:
	audioPickUp.play()
	

func _start_shaking() -> void:
	do_shake = true
	
func _stop_shaking() -> void:
	do_shake = false
	rotation_degrees = 0	


func _physics_process(delta: float) -> void:
	if not do_shake:
		return
	ringing_phone.rotation_degrees = lerp_angle(rotation_degrees, current_target_angle, elapsed * shaking_speed)
	elapsed += delta

	if abs(ringing_phone.rotation_degrees) >= shaking_angle:
		current_target_angle = -current_target_angle
		elapsed = 0
