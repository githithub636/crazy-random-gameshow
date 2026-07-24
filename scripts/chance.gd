extends CharacterBody2D


@onready var slash = $Slash

@onready var timer: Timer = $Timer

@export var speed: float = 200.0

var health = 5

var can_slash: bool = true

var pos = global_position

	


func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	direction.x = Input.get_axis("A-Left","D-Right")
	direction.y = Input.get_axis("W-Up", "S- Down")
	
	# Normalize so diagonal movement isn't faster
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		
	
	velocity = direction * speed
	move_and_slide()

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("LMB") and can_slash == true):
		var mouse_pos = get_global_mouse_position()
		slash.play(global_position,mouse_pos)
		can_slash = false
		timer.start()
	pos = global_position

func _on_timer_timeout() -> void:
	can_slash = true

func take_damage(amount):
	health -= amount
	print(health)
	if health <= 0:
		get_tree().call_deferred("reload_current_scene")
		
	
