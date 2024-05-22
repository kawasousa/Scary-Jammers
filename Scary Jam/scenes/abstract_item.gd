extends Sprite2D

@export var ID = "0"

func _ready():
	texture = load("res://assets/" + ItemData.get_texture(ID))
