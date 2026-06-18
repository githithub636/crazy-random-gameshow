extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	direction.x = Input.get_axis("A-Left","D-Right")
	direction.y = Input.get_axis("W-Up", "S- Down")
	
	# Normalize so diagonal movement isn't faster
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		
	
	velocity = direction * speed
	move_and_slide()
