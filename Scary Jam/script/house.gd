extends Node2D


func _ready():
	Global.house_scene_node = self
	Global.can_start_invasion_timer = true
	Global.can_spawn_enemies = false

func _process(delta):
	if Global.game_win:
		get_tree().change_scene_to_file("res://scenes/win_scene.tscn")

func _on_passage_area_body_entered(body):
	if body.is_in_group("Player"):
		Global.invasion_rect_factor = 0
