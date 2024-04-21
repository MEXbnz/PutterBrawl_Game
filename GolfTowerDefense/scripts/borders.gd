extends Node



func _on_left_body_entered(body):
	body.velocity.x *= -1




func _on_top_body_entered(body):
	body.velocity.y *= -1


func _on_right_body_entered(body):
	body.velocity.x *= -1


func _on_bottom_body_entered(body):
	body.velocity.y *= -1
