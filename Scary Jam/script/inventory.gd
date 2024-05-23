extends Control

@onready var plus_life = $HBoxContainer/plus_life


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_node.can_move = false
		plus_life.grab_focus()

func _on_quit_menu_pressed():
	Global.player_node.can_move = true
	for button in get_node("HBoxContainer").get_children():
		button.release_focus()

func _on_plus_life_pressed():
	if Global.player_life_resource > 0 and Global.player_life < 5:
		Global.player_life_resource -= 1
		Global.player_life += 1

func _on_plus_shoot_pressed():
	if Global.player_shoot_resource > 0:
			Global.player_shoot_resource -= 1
			Global.player_shooots += 1
			Global.can_spawn_trees = true
