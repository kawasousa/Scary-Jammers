extends Node

var game_over: bool = false
@onready var tick_timer: Timer = $tick_timer
@onready var invasion_timer: Timer = $invasion_timer
@onready var spawn_enemy_timer = $spawn_enemy_timer
const ENEMY_SCENE = preload("res://scenes/enemy_scene.tscn")
var enemy_node
var house_scene_node
var outdoor_scene_node
var hud_node
var invasion_rect_factor: int = 0
var player_position: Vector2 = Vector2(385, 540)
var player_node
var player_shooots: int
var player_life: int
var player_shoot_resource: int
var player_life_resource: int
var can_spawn_enemies: bool = false
var can_spawn_trees: bool = true

################################################################################


func _ready():
	player_shoot_resource = 0
	player_life_resource = 0
	player_life = 5
	player_shooots = 0
	Input.set_custom_mouse_cursor(load("res://assets/UI_Flat_Select_02a1.png"))

func _process(_delta):
	get_bullet()
	check_player_life()

## Obtém as balas e limita ela a no mínimo 0 e no máximo 100
func get_bullet() -> int:
	player_shooots = min(player_shooots, 100)
	player_shooots = max(player_shooots, 0)
	return player_shooots


func update_bullets(update_factor) -> int:
	## Atualiza as balas com base no sinal que é recebido
	## A função recebe um valor e incrementa esse valor na quantidade de balas
	player_shooots += update_factor
	return player_shooots

func _on_tick_timer_timeout():
	invasion_rect_factor += 1
	if invasion_rect_factor == 200:
		invasion_rect_factor = 1

func _on_invasion_timer_timeout():
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
	player_life = min(player_life, 5)
	player_life = max(player_life, 0)

func _on_spawn_enemy_timer_timeout():
	spawn_enemy()
