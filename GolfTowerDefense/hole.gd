extends Area2D

@onready var game_manager = $"../../gameManager"


func _on_body_entered(body):
	if body.name != "player":
		game_manager.health_change(-3)
		body.queue_free()

