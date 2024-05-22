extends Control

@onready var play_button = $VBoxContainer2/play_button


func _ready():
	play_button.grab_focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/house_scene.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
