extends Node
class_name TrackHandler

@export var day_tracks: Array[AudioStream]

func get_track_for_day(day: int) -> AudioStream:
	if day < day_tracks.size():
		return day_tracks[day]	
	return day_tracks[day_tracks.size() - 1]
		
