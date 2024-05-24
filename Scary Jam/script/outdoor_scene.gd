extends Node2D


func _ready():
	Global.outdoor_scene_node = self
	Global.can_spawn_enemies = true
	Global.can_start_invasion_timer = false
	## spawna os inimigos assim que a cena roda

func _process(delta):
	if Global.game_win:
		get_tree().change_scene_to_file("res://scenes/win_scene.tscn")
