extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Crouching")
	player.jump_power = Vector2.ZERO

func physics_process(_delta):
	if not Input.is_action_pressed("crouch"):
		SM.set_state("Idle")
	if player.get_node("Pipe/RayCast").is_colliding():
		var test_transport = player.get_node("Pipe/RayCast").get_collider()
		if test_transport.is_in_group("Pipe"):
			player.position = test_transport.transport_to
			var camera = get_node_or_null("/root/Game/Camera")
			if camera != null and test_transport.transport_to.y > 960:
				camera.limit_bottom = 1920
			elif camera != null:
				camera.limit_bottom = 960
		
	player.velocity = Vector2.ZERO
	player.move_and_slide(player.velocity, Vector2.UP)
