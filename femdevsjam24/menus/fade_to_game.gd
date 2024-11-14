extends Node2D

@export var sceneToOpenPath: String
@export var fade: BlackFade
@export var music_player: AudioStreamPlayer

var plantSFX: AudioStreamPlayer

func _ready():
	$Button.connect("pressed", _start_fading_out)
	get_parent().get_node("0PotDry").hide()
	plantSFX = $PlantSFX


func _start_fading_out() -> void:
	plantSFX.play(1.6)
	await plantSFX.finished
	fade.fade_to_black()
	fade.connect("fade_out_finished", change_scene)

func change_scene() -> void:
	MusicTracker.current_music_offset = music_player.get_playback_position()
	get_tree().change_scene_to_file(sceneToOpenPath)
