extends Node2D


func _ready():
	Global.outdoor_scene_node = self
	Global.can_spawn_enemies = true
	Global.can_start_invasion_timer = false
	## spawna os inimigos assim que a cena roda
