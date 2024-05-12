extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var player = $"../player"
	
func _ready():
	pass
	
func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()	
	if player.visible:
		add_child(enemy)
