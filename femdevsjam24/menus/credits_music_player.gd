extends AudioStreamPlayer

func _ready() -> void:
	play(MusicTracker.current_music_offset)
