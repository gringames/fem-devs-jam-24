extends Node2D
class_name OpenNewspaper

@export var article: NewspaperArticle

var clickable: Clickable
var audioStreamPlayer: AudioStreamPlayer

func _ready() -> void:
	clickable = $NewspaperVisual/Clickable
	clickable.connect("mouse_clicked_on_object", show_article)
	audioStreamPlayer = $AudioStreamPlayer


func show_article() -> void:
	article.appear()
	audioStreamPlayer.play()
