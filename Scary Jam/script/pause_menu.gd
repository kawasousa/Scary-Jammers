extends CanvasLayer

@onready var resume_button = $Control/VBoxContainer/resume_button
@onready var quit_to_menu_button = $Control/VBoxContainer/quit_to_menu_button

func _ready():
	visible = false
	quit_to_menu_button.set_mouse_filter(Control.MOUSE_FILTER_IGNORE)

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		quit_to_menu_button.set_mouse_filter(Control.MOUSE_FILTER_PASS)
		resume_button.grab_focus()
		get_tree().paused = true
		visible = true

func _on_resume_button_pressed():
	get_tree().paused = false
	visible = false

func _on_quit_to_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")
