extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")


	
func _ready():
	pass
	
func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()	
	add_child(enemy)
