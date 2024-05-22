extends Area2D

@onready var texture_rect = $TextureRect

func _ready():
	if get_tree().get_nodes_in_group("enemy").size() > 0:
		var enemy_position: Vector2 = get_tree().get_first_node_in_group("enemy").global_position
		print(get_tree().get_first_node_in_group("enemy").name, enemy_position)
		look_at(enemy_position)
	else:
		rotation = 0

func _process(delta):
	movement(delta)
	get_enemy_position()
	texture_rect.size = Vector2(20, 20)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func movement(delta) -> void:
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += 600 * delta * direction

func get_enemy_position():
	pass
