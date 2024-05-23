extends Node2D


func _ready():
	Global.house_scene_node = self
	Global.invasion_timer.start()
	Global.tick_timer.start()

func _on_passage_area_body_entered(body):
	if body.is_in_group("Player"):
		Global.invasion_timer.stop()
		Global.tick_timer.stop()
		Global.invasion_rect_factor = 0
