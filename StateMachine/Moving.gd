extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

onready var prev_direction = player.direction

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Moving")
	player.jump_power = Vector2.ZERO

func physics_process(_delta):
	if not player.is_on_floor():
		SM.set_state("Falling")
	else:
		player.velocity.y = 0
	if Input.is_action_pressed("jump"):
		SM.set_state("Moving_and_Jumping")
	if player.get_node("Pipe_Exit/RayCast").is_colliding():
		var test_transport = player.get_node("Pipe_Exit/RayCast").get_collider()
		if test_transport.is_in_group("Pipe"):
			player.position = test_transport.transport_to
			var camera = get_node_or_null("/root/Game/Camera")
			if camera != null and test_transport.transport_to.y > 960:
				camera.limit_bottom = 1920
			elif camera != null:
				camera.limit_bottom = 960
	elif player.is_moving():
		if player.direction != prev_direction:
			player.velocity.x = 0
			prev_direction = player.direction
		player.velocity += player.move_speed * player.move_vector()
		player.move_and_slide(player.velocity, Vector2.UP)
	else:
		player.velocity = Vector2.ZERO
		SM.set_state("Idle")
