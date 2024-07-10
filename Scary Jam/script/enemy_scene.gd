extends CharacterBody2D
class_name Enemy

var speed = 9000
const HEART_RESOURCE = preload("res://scenes/heart_resource.tscn")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision = $Area2D/CollisionShape2D
@onready var collisionShape = $CollisionShape2D


func _ready():
	Global.enemy_node = self

func _physics_process(delta):
	if Global.game_over: speed = 0
	movement(delta)
	move_and_slide()

func movement(delta) -> void:
	velocity = position.direction_to(Global.player_node.global_position) * delta * speed
	animated_sprite_2d.flip_h = velocity.x < 0

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Global.reduce_player_life()
		body.global_position -= global_position - body.global_position

func _on_area_2d_area_entered(area):
	if area.is_in_group("shoots"):
		collision.queue_free()
		collisionShape.queue_free()
		animated_sprite_2d.play("hurt")
		speed = 0
		area.queue_free()
		await animated_sprite_2d.animation_finished
		var heart = HEART_RESOURCE.instantiate()
		if randi_range(1, 3) == 1:
			get_parent().get_parent().get_node("resources").add_child(heart)
			heart.global_position = global_position
		queue_free()
