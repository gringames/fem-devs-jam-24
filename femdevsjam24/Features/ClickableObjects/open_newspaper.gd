extends Node2D
class_name OpenNewspaper

@export var article: NewspaperArticle

var clickable: Clickable

func _ready() -> void:
	clickable = $NewspaperVisual/Clickable
	clickable.connect("mouse_clicked_on_object", show_article)


func show_article() -> void:
	article.appear()
