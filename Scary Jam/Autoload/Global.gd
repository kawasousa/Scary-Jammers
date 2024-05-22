extends Node

var game_over: bool = false
@onready var tick_timer: Timer = $tick_timer
@onready var invasion_timer: Timer = $invasion_timer
const ENEMY_SCENE = preload("res://scenes/enemy_scene.tscn")
var enemy_node
var house_scene_node
var outdoor_scene_node
var hud_node
var hour_rect_size_factor: int = 0
var bullets: int
var player_node
var player_life: int
var player_position: Vector2 = Vector2(385, 540)
var can_spawn_enemies: bool = false

func _ready():
	player_life = 5
	bullets = 0

func _process(_delta):
	get_bullet()
	spawn_enemy()
	check_player_life()

## Obtém a satisfação e limita ela a no mínimo 0 e no máximo 100
func get_bullet() -> int:
	bullets = min(bullets, 100)
	bullets = max(bullets, 0)
	return bullets

## Atualiza a satisfação com base no sinal que é recebido
## A função recebe um valor e incrementa ou decrementa esse valor na satisfação
func update_bullets(update_factor) -> int:
	## O input será substituido pelo sinal mandado pela receita
	bullets += update_factor
	return bullets

func _on_tick_timer_timeout():
	hour_rect_size_factor += 1
	if hour_rect_size_factor == 11:
		hour_rect_size_factor = 1

func _on_invasion_timer_timeout():
	game_over = true

func spawn_enemy() -> void:
	if can_spawn_enemies == true:
		for spawn: Marker2D in outdoor_scene_node.get_node("enemy_spawner").get_children():
			var enemy = ENEMY_SCENE.instantiate()
			enemy.global_position = spawn.global_position
			outdoor_scene_node.get_node("enemy_group").add_child(enemy)
			enemy.add_to_group("enemy")
		can_spawn_enemies = false

func reduce_player_life() -> void:
	player_life -= 1

func increase_player_life() -> void:
	player_life += 1

func check_player_life() -> void:
	if player_life == 0:
		game_over = true
	player_life = min(player_life, 5)
	player_life = max(player_life, 0)
