extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var button = $CenterContainer/VBoxContainer/Button


func _ready():
	Global.can_spawn_enemies = false
	animation_player.play("win_animation")
	await animation_player.animation_finished
	button.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")
