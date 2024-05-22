extends Node2D


func _ready():
	Global.outdoor_scene_node = self
	Global.can_spawn_enemies = true

func _on_tree_exited():
	Global.can_spawn_enemies = false
