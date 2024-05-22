extends CharacterBody2D

const SPEED = 30000
const SHOOT_SCENE = preload("res://scenes/shoot_scene.tscn")


func _ready():
	Global.player_node = self
	global_position = Global.player_position

func _physics_process(delta):
	movement(delta)
	shoot()
	move_and_slide()

## Movimentação do jogador
func movement(delta) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED * delta

func shoot() -> void:
	if Input.is_action_just_pressed("shoot") and get_parent().name == "outdoor_scene" and Global.player_shooots > 0:
		var shoot_instance = SHOOT_SCENE.instantiate()
		get_parent().get_node("shoot_group").add_child(shoot_instance)
		shoot_instance.global_position = global_position
		shoot_instance.look_at(get_global_mouse_position())
		shoot_instance.add_to_group("shoots")
		Global.player_shooots -= 1
