extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var restart_button = $AnimationPlayer/restart_button
@onready var game_over_message_label = $AnimationPlayer/game_over_message
@export var message: String = "Você foi pego pelos Jammers"
var game_over_check = false


func _ready():
	hide()

func _process(delta):
	set_label_message()
	if Global.game_over:
		show()
		animation_player.play("game_over")
		get_tree().paused = true
		restart_button.grab_focus()

func _on_restart_button_pressed():
	get_tree().paused = false
	Global.game_over = false
	Global.player_life = 5
	Global.invasion_rect_factor = 0
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")

func set_label_message() -> void:
	game_over_message_label.text = message
