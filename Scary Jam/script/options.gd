extends Control

@onready var quit_button = $VBoxContainer2/quit_button
@onready var days_button = $VBoxContainer2/HBoxContainer/days_button

func _ready():
	days_button.select(Global.max_game_days - 1)
	quit_button.grab_focus()

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")

func _on_days_button_item_selected(index):
	Global.max_game_days = index + 1

func _on_fullscreeen_pressed():
	Global.toggleFullscreenMode()
