extends Area2D

@onready var texture_rect = $TextureRect


func _process(delta):
	set_item_float(delta)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_life_resource += 1
		queue_free()

func set_item_float(delta) -> void:
	texture_rect.position.y += sin(Engine.get_frames_drawn() * 5 * delta) * 0.3
