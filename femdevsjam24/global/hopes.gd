extends Node

var hopes: Array[String] = []

func add_hope(hope: String) -> void:
	hopes.append(hope)

func get_hopes_string() -> String:
	var asString: String = "Hopes: [ "
	for hope in hopes:
		asString += hope + ", "
		
	return asString + "]"
 
func print_hopes() -> void:
	print(get_hopes_string())
