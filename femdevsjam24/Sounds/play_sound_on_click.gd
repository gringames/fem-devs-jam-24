extends Node
class_name PlaySoundOnClick

@export var audio: AudioStreamPlayer
@export var sound: AudioStream
@export var clickable: Clickable

func _ready() -> void:
	audio.stream = sound
	clickable.connect("mouse_clicked_on_object", play_sound)

func play_sound() -> void:
	audio.play()
