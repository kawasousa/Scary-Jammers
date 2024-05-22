extends Area2D

@onready var texture_rect = $TextureRect


func _process(delta):
	movement(delta)
	texture_rect.size = Vector2(20, 20)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func movement(delta) -> void:
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += 600 * delta * direction

