extends Node2D

const ABSTRACT_ITEM = preload("res://scenes/abstract_item.tscn")


func _ready():
	spawn_random_trees()
	Global.can_start_invasion_timer = true
	Global.can_spawn_enemies = false

func _process(delta):
	if Global.game_win:
		get_tree().change_scene_to_file("res://scenes/win_scene.tscn")

	if Global.can_spawn_shoot_resources:
		for tree in get_node("tree_group").get_children():
			tree.position.y = tree.start_position.y + sin((Engine.get_frames_drawn() * delta * 2)) * 3
			tree.rotation += sin((Engine.get_frames_drawn() * delta * 7)) * 0.04

func spawn_random_trees() -> void:
	if Global.can_spawn_shoot_resources:
		for spawn in get_node("tree_spawn_markers").get_children():
			if randi_range(1, 2) == 1:
				var item = ABSTRACT_ITEM.instantiate()
				item.ID = "3"
				get_node("tree_group").add_child(item)
				item.start_position = spawn.global_position
				item.global_position = spawn.global_position

func _on_tree_exited():
	Global.can_spawn_shoot_resources = false
