extends AudioStreamPlayer
class_name ButtonSFX

@export_category("Buttons")
@export var watering_button: Button
@export var trimming_button: Button
@export var temperature_button: Button
@export var feeding_button: Button

@export_category("SFXs")
@export var sfx_player: AudioStreamPlayer
@export var watering_sfx: AudioStream
@export var trimming_sfx: AudioStream
@export var temperature_sfx: AudioStream
@export var feeding_sfx: AudioStream

func _ready() -> void:
	watering_button.connect("pressed", _play_water_sfx)
	trimming_button.connect("pressed", _play_trim_sfx)
	temperature_button.connect("pressed", _play_check_temperature_sfx)
	feeding_button.connect("pressed", _play_feed_sfx)
	

func _play_water_sfx() -> void:
	_play_sfx(watering_sfx)

func _play_trim_sfx() -> void:
	_play_sfx(trimming_sfx)

func _play_check_temperature_sfx() -> void:
	_play_sfx(temperature_sfx, 0.15)

func _play_feed_sfx() -> void:
	_play_sfx(feeding_sfx, 0.3)


func _play_sfx(sfx: AudioStream, offset: float = 0) -> void:
	sfx_player.stream = sfx
	sfx_player.play(offset)
