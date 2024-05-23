@tool
extends Area2D

@export var target_area: String
@export var player_position: Vector2


func _on_body_entered(body):
	#passagem de cenas
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(target_area)
		Global.player_position = Vector2(player_position)

func _process(delta):
	update_configuration_warnings()

func _get_configuration_warnings():
	# aviso caso o campo de alvo não tenha sido preenchido
	var warnings = []
	if len(target_area) <= 0:
		warnings.append("Explicite a área alvo do teleporte no campo target_area")
	return warnings
