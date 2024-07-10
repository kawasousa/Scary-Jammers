extends CanvasLayer

@onready var shoot_resource_label = $shoot_resource/shoot_resource_label
@onready var life_resource_label = $life_resource/life_resource_label
@onready var life_rect = $life/life_rect
@onready var shoot_rect = $shoot/shoot_rect
@onready var invasion_rect = $invasion/invasion_rect
@onready var invasion = $invasion
@onready var invasion_alert_polygon = $invasion/invasion_alert_polygon
@onready var time_label = $day_time/time_label


func _ready():
	Global.hud_node = self

func _process(delta):
	set_left_time_label()
	update_player_shoot_label()
	update_time_to_invasion_rect(delta)
	update_player_life_label()
	update_shoot_resource_label()
	update_life_resource_label()
	show_invasion_label()

func update_player_shoot_label() -> void:
	shoot_rect.custom_minimum_size.x = Global.player_shooots * 10

func update_time_to_invasion_rect(delta) -> void:
	invasion_rect.custom_minimum_size.x = Global.invasion_rect_factor * 0.5
	invasion_alert_polygon.position.y += sin((Engine.get_frames_drawn() * delta * 5)) * 0.2

func update_player_life_label() -> void:
	life_rect.size.x = Global.player_life * 30

func update_shoot_resource_label() -> void:
	shoot_resource_label.text =  str(Global.player_shoot_resource)

func update_life_resource_label() -> void:
	life_resource_label.text = str(Global.player_life_resource)

func show_invasion_label() -> void:
	if Global.can_start_invasion_timer:
		invasion.visible = true
		var greenColor = 1.2 - Global.invasion_rect_factor / 400
		invasion_rect.color = Color(1,greenColor,0)
		invasion_alert_polygon.color = Color(1,greenColor,0)
	else:
		invasion.visible = false

func set_left_time_label() -> void:
	var seconds = Global.game_seconds
	var zero_second = "0" if seconds < 10 else ""
	time_label.text = "Dia: %s // 0%s:%s%s" %[Global.game_day, Global.game_minutes, zero_second, seconds]
