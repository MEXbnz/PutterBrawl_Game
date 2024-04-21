extends CharacterBody2D


@export var friction = 2
var power = Vector2()
var mouse_position = null
var mp_1 = Vector2()
var mp_2 = Vector2()
@export var limiter = 100

@onready var power_line = $"../powerLine"
@onready var mouse_area = $mouse_sprites/mouse_area
@onready var mouse_dot = $mouse_sprites/mouse_dot


func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	power = (mp_1 - mp_2)
	
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
	
	if Input.is_action_just_pressed("LMB"):
		mp_1 = mouse_position
		mouse_area.visible = true
		mouse_area.global_position = mouse_position
		
	#else:
		#mouse_area.visible = false
		
	if Input.is_action_pressed("LMB"):
		velocity = Vector2(0, 0)
		power_line.visible = true
		mp_2 = mouse_position
		power_line.set_point_position(0, position)
		mouse_dot.visible = true
		mouse_dot.global_position = mouse_position

		
		if power.length() > limiter:
			power_line.set_point_position(1, position + power.normalized() * (limiter * 1.5))
		else:
			power_line.set_point_position(1, position + power * 1.5)
			
	elif Input.is_action_just_released("LMB"):
		power_line.visible = false
		mouse_dot.visible = false
		mouse_area.visible = false
		
		if power.length() > limiter:
			velocity += power.normalized() * (limiter * 2)
		else:
			velocity += power * 2
		
	velocity  = velocity.move_toward(Vector2(0, 0), friction)

	move_and_collide(velocity/60)


func _unhandled_input(event):
	if event == InputEventMouse:
		print(event.position)
