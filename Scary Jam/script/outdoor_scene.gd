extends Node2D


func _ready():
	Global.outdoor_scene_node = self
	Global.can_spawn_enemies = true
	## spawna os inimigos assim que a cena roda

func _on_tree_exited():
	Global.can_spawn_enemies = false
	## quando sai da cena, o spawn de inimigos é encerrado momentaneamente
