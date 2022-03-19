extends Area2D



func _on_Pit_body_entered(body):
	if body.name == "Player":
		body.queue_free()
