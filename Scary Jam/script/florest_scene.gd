extends Node2D

const ABSTRACT_ITEM = preload("res://scenes/abstract_item.tscn")


func _ready():
	spawn_random_trees()

func spawn_random_trees() -> void:
	for spawn in get_node("tree_spawn_markers").get_children():
		if randi_range(1, 2) == 1:
			var item = ABSTRACT_ITEM.instantiate()
			item.ID = "2"
			get_node("tree_group").add_child(item)
			item.global_position = spawn.global_position
