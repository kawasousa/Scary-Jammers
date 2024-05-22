extends Node

var content : Dictionary

func _ready():
	var file = FileAccess.open("res://Autoload/itens.json",FileAccess.READ)
	content = JSON.parse_string(file.get_as_text())
	file.close()

func get_texture(ID):
	return content[ID]["texture"]
