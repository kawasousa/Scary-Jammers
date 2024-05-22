extends CanvasLayer

@onready var bullets_label: Label = $MarginContainer/HBoxContainer/bullets_label
@onready var player_life_label: Label = $MarginContainer/HBoxContainer/player_life
@onready var hour_rect: ColorRect = $MarginContainer/HBoxContainer/HBoxContainer/hour_rect
@onready var recurso_shoot = $MarginContainer/HBoxContainer/recurso_shoot


func _ready():
	Global.hud_node = self

func _process(_delta):
	update_satisfaction_label()
	update_hour()
	update_player_life_label()
	update_shoot_resource_label()

func update_satisfaction_label() -> void:
	var satisfaction = Global.get_bullet()
	bullets_label.text = "Balas: " + str(satisfaction)

## Atualiza o tamaho do retângulo que indica as horas
func update_hour() -> void:
	var rect_size_factor = Global.hour_rect_size_factor
	hour_rect.custom_minimum_size.x = rect_size_factor * 10

func update_player_life_label() -> void:
	player_life_label.text = "Saúde: " + str(Global.player_life)

func update_shoot_resource_label() -> void:
	recurso_shoot.text = "Recurso -> Bala: " + str(Global.player_shoot_resource)

func update_life_resource_label() -> void:
	recurso_shoot.text = "Recurso -> Vida: " + str(Global.player_life_resource)
