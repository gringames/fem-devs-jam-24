extends Node
class_name Clickable

### Signals -------------------------------------------------------------------------------------------

signal mouse_hover_start
signal mouse_hover_end
signal mouse_clicked_on_object
signal mouse_released_from_object


### Variables -----------------------------------------------------------------------------------------

var area2D : Area2D
var is_mouse_over : bool = false
var is_mouse_holding_me : bool = false


### Ready & Process -----------------------------------------------------------------------------------

func _ready() -> void:
	area2D = $Area2D
	area2D.connect("mouse_entered", _on_mouse_entered)
	area2D.connect("mouse_exited", _on_mouse_exited)
	EventBus.connect("mouse_clicked", _on_mouse_clicked)
	EventBus.connect("mouse_released", _on_mouse_released)



### Handling Mouse Hover ------------------------------------------------------------------------------

func _on_mouse_entered() -> void:
	is_mouse_over = true
	emit_signal("mouse_hover_start")


func _on_mouse_exited() -> void:
	is_mouse_over = false
	emit_signal("mouse_hover_end")


### Handling Mouse Click ------------------------------------------------------------------------------

func _on_mouse_clicked() -> void:
	if not is_mouse_over:
		return
	is_mouse_holding_me = true
	emit_signal("mouse_clicked_on_object")
	print("clicked on ", name)
		

func _on_mouse_released() -> void:
	if not is_mouse_holding_me:
		return
	is_mouse_holding_me = false
	emit_signal("mouse_released_from_object")
	
