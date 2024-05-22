extends Sprite2D

@export var ID = "0"

func _ready():
	texture = load("res://assets/" + ItemData.get_texture(ID))

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_shooots += 1
		queue_free()
