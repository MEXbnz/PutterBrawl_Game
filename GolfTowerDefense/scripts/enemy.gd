extends CharacterBody2D


@onready var nav_agent = $NavigationAgent2D
@onready var game_manager = $"../../../gameManager"
@onready var player = $"../../../gameObjects/player"


var speed = 60

var points = 1000
var damage = -10

func _physics_process(_delta):
	
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	var intended_velocity = dir * speed
	nav_agent.set_velocity(intended_velocity)
	
	if player.velocity == Vector2(0, 0):
		game_manager.multiplier = 1.0


func make_path():
	var target = player
	nav_agent.target_position = target.global_position


func _on_timer_timeout():
	make_path()


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()


func _on_area_2d_body_entered(body):
	if (body.name == "player"):
		if (body.velocity != Vector2(0, 0)):
			game_manager.score_change(points)
			game_manager.multiplier += 0.25
			queue_free()
		game_manager.health_change(damage)

		
