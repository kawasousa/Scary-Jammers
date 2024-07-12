extends Area2D

@export var target_area: String
@export var player_position: Vector2


func _on_body_entered(body):
	if body.is_in_group("Player") and target_area != null:
		get_tree().change_scene_to_file(target_area)
		Global.player_position = Vector2(player_position)
