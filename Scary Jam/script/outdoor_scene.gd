extends Node2D


func _ready():
	Global.outdoor_scene_node = self
	Global.can_spawn_enemies = true
