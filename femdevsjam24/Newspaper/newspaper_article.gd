extends Node2D
class_name NewspaperArticle


var date_label: RichTextLabel
var headline_label: RichTextLabel
var content_label: RichTextLabel

var close_button: Button


func _ready() -> void:
	date_label = $DialogueBox/Date
	headline_label = $DialogueBox/Headline
	content_label = $DialogueBox/Message
	
	close_button = $DialogueBox/CloseButton
	close_button.connect("pressed", disappear)
	disappear()
	
	
# ARTICLE ------------------------------------------------------------------------------------------

func set_article(article :Array):
	if article.size() != 3:
		return
	_set_date(article[0])
	_set_headline(article[1])
	_set_content(article[2])
	

func _set_content(text: String) -> void:
	content_label.text = text;

func _set_date(text: String) -> void:
	date_label.text = text;

func _set_headline(text: String) -> void:
	headline_label.text = text;
	
	
func _clear_all() -> void:
	_set_content("")
	_set_date("")
	_set_headline("")


# UI -----------------------------------------------------------------------------------------------

func appear() -> void:
	show()
	
	
func disappear() -> void:
	hide()
	_clear_all()
