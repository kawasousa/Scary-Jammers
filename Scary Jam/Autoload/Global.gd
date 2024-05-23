extends Node

const ENEMY_SCENE = preload("res://scenes/enemy_scene.tscn")
@onready var timer: Timer = $Timer
var game_over: bool = false
var game_win: bool = false
var game_seconds: int = 0
var game_minutes: int = 0
var can_start_invasion_timer: bool = false
var enemy_node
var house_scene_node
var outdoor_scene_node
var hud_node
var player_node
var invasion_rect_factor: int = 0
var player_position: Vector2 = Vector2(385, 540)
var player_shooots: int
var player_life: int
var player_shoot_resource: int
var player_life_resource: int
var can_spawn_enemies: bool = false
var can_spawn_shoot_resources: bool = true

################################################################################


func _ready():
	reset_game_values()
	Input.set_custom_mouse_cursor(load("res://assets/UI_Flat_Select_02a1.png"))

func _process(_delta):
	set_invasion_timer()
	get_bullet()
	spawn_enemy()
	check_player_life()

## Obtém as balas e limita ela a no mínimo 0 e no máximo 100
func get_bullet() -> int:
	player_shooots = min(player_shooots, 10)
	player_shooots = max(player_shooots, 0)
	return player_shooots


func update_bullets(update_factor) -> int:
	## Atualiza as balas com base no sinal que é recebido
	## A função recebe um valor e incrementa esse valor na quantidade de balas
	player_shooots += update_factor
	return player_shooots

func set_invasion_timer() -> void:
	if can_start_invasion_timer:
		invasion_rect_factor += 1
		if invasion_rect_factor == 800:
			game_over = true

func spawn_enemy() -> void:
	if can_spawn_enemies == true and get_tree().get_nodes_in_group("enemy").size() < 2:
		for spawner in outdoor_scene_node.get_node("enemy_spawner").get_children():
			var enemy = ENEMY_SCENE.instantiate()
			enemy.global_position = spawner.global_position
			outdoor_scene_node.get_node("enemy_group").add_child(enemy)
			enemy.add_to_group("enemy")

func reduce_player_life() -> void:
	player_life -= 1

func increase_player_life() -> void:
	player_life += 1

func check_player_life() -> void:
	## checando vida do player e transformando a condição de game over em verdadeira
	if player_life == 0:
		game_over = true
		can_spawn_enemies = false
	player_life = min(player_life, 5)
	player_life = max(player_life, 0)

func reset_game_values() -> void:
	game_win = false
	game_seconds = 0
	game_minutes = 0
	timer.stop()
	player_position = Vector2(385, 540)
	invasion_rect_factor = 0
	can_start_invasion_timer = false
	player_shoot_resource = 0
	player_shooots = 0
	player_life_resource = 0
	player_life = 1

func _on_timer_timeout():
	game_seconds += 1
	print(game_seconds)
	if game_seconds == 60:
		game_seconds = 0
		game_minutes += 1
	if game_minutes == 2:
		game_win = true
