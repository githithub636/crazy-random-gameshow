extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):
	var input_dir = Vector2(
	Input.get_axis("ui_left", "ui_right"),
	Input.get_axis("ui_up", "ui_down")
		)

	# Normalize so diagonals aren't faster
	if input_dir != Vector2.ZERO:
		velocity = input_dir.normalized() * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
