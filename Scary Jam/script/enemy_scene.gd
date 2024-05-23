extends CharacterBody2D
class_name Enemy

const SPEED = 10000
const HEART_RESOURCE = preload("res://scenes/heart_resource.tscn")

func _ready():
	Global.enemy_node = self

func _physics_process(delta):
	movement(delta)
	move_and_slide()

func movement(delta) -> void:
	velocity = position.direction_to(Global.player_node.global_position) * delta * SPEED

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Global.reduce_player_life()
		body.global_position -= global_position - body.global_position

func _on_area_2d_area_entered(area):
	if area.is_in_group("shoots"):
		var heart = HEART_RESOURCE.instantiate()
		if randi_range(1, 2) == 1:
			get_parent().get_parent().get_node("resources").add_child(heart)
			heart.global_position = global_position
		area.queue_free()
		queue_free()
