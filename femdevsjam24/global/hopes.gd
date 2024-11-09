extends Node

var hopes: Array[String] = []
var player_hope: String

func save_player_hope(hope: String):
	player_hope = hope
	

func add_hope(hope: String, force_add_even_if_empty: bool = false) -> void:
	if hope.is_empty() && not force_add_even_if_empty:
		return
	hopes.append(hope)

func get_hopes_string() -> String:
	var asString: String = "Hopes: [ "
	for hope in hopes:
		asString += hope + ", "
	
	if not hopes.is_empty():
		# remove last comma
		asString = asString.substr(0, asString.length() - 2)
		
	return  asString + " ]"
 


func print_hopes() -> void:
	print(get_hopes_string())
