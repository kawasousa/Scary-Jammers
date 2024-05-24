extends CharacterBody2D

@onready var sprite = $sprite
const SPEED = 20000
const SHOOT_SCENE = preload("res://scenes/shoot_scene.tscn")
var can_move = true


func _ready():
	Global.player_node = self
	global_position = Global.player_position

func _physics_process(delta):
	if can_move:
		movement(delta)
	else:
		velocity = Vector2(0,0)
	shoot()
	move_and_slide()

## Movimentação do jogador
func movement(delta) -> void:
	if Input.is_action_pressed("ui_left"):
		velocity.x = delta * -SPEED
		sprite.flip_h = false
		sprite.play("walking_side")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = delta * SPEED
		sprite.flip_h = true
		sprite.play("walking_side")
	else:
		velocity.x = 0
		sprite.pause()
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = delta * -SPEED
		sprite.play("walking_up")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = delta * SPEED
		sprite.play("walking_down")
	else:
		velocity.y = 0

func shoot() -> void:
	## tiros sendo adicionados através da criação de nós filhos 
	if Input.is_action_just_pressed("shoot") and get_parent().name == "outdoor_scene" and Global.player_shooots > 0:
		var shoot_instance = SHOOT_SCENE.instantiate()
		get_parent().get_node("shoot_group").add_child(shoot_instance)
		shoot_instance.global_position = global_position
		shoot_instance.look_at(get_global_mouse_position())
		shoot_instance.add_to_group("shoots")
		Global.player_shooots -= 1
