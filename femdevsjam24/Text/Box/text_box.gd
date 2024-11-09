extends Node2D
class_name TextBox


@export var visible_by_default: bool = false

var text_label: RichTextLabel
var npc_icon: TextureRect


func _ready() -> void:
	text_label = $DialogueBox/BackgroundTexture/RichTextLabel
	npc_icon = $DialogueBox/BackgroundTexture/NPCIcon
	
	if not visible_by_default:
		_disappear()

# TEXT ---------------------------------------------------------------------------------------------

func set_text(text: String) -> void:
	text_label.text = text;
	

func clear_text() -> void:
	set_text("")


# ICON ---------------------------------------------------------------------------------------------

func set_icon(icon: Texture2D) -> void:
	npc_icon.texture = icon


# BOX ----------------------------------------------------------------------------------------------

func _appear() -> void:
	pass
	
	
func _disappear() -> void:
	pass
