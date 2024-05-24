extends Control

@onready var plus_life = $Area2D/VBoxContainer/HBoxContainer/plus_life
@onready var quit_menu = $Area2D/VBoxContainer/quit_menu
@onready var area_2d = $Area2D


func _ready():
	visible = false

func _process(delta):
	open_inventory()

func _on_quit_menu_pressed():
	for button in get_node("Area2D/VBoxContainer/HBoxContainer").get_children():
		button.release_focus()
		quit_menu.release_focus()
		visible = false

func _on_plus_life_pressed():
	if Global.player_life_resource > 0 and Global.player_life < 5:
		Global.player_life_resource -= 1
		Global.player_life += 1

func _on_plus_shoot_pressed():
	if Global.player_shoot_resource > 0:
			Global.player_shoot_resource -= 1
			Global.player_shooots += 1
			Global.can_spawn_shoot_resources = true

func open_inventory() -> void:
	if Input.is_action_just_pressed("open_inventory"):
		if area_2d.overlaps_body(Global.player_node):
			visible = true
			plus_life.grab_focus()
