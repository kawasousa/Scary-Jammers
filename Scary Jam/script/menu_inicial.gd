extends Control

@onready var play_button = $VBoxContainer2/play_button


func _ready():
	play_button.grab_focus()
	Global.reset_game_values()

func _on_days_button_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/house_scene.tscn")
	Global.timer.start()
