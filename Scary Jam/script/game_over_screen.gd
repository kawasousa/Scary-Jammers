extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var restart_button: Button = $AnimationPlayer/restart_button
@onready var game_over_message_label = $AnimationPlayer/game_over_message
@export var message: String = "Você foi pego pelos Jammers"
var game_over_check = false
var playerDeadCheck: bool = false


func _ready():
	hide()
	restart_button.set_mouse_filter(Control.MOUSE_FILTER_IGNORE)

func _process(delta):
	set_label_message()
	if Global.game_over and Global.isPlayerDied:
		show()
		get_parent().get_node("pause_menu").hide()
		get_tree().paused = true
		animation_player.play("game_over")
		await get_tree().create_timer(2).timeout
		restart_button.set_mouse_filter(Control.MOUSE_FILTER_STOP)
		restart_button.grab_focus()

func _on_restart_button_pressed():
	get_tree().paused = false
	Global.game_over = false
	Global.player_life = 5
	Global.invasion_rect_factor = 0
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")

func set_label_message() -> void:
	game_over_message_label.text = message
