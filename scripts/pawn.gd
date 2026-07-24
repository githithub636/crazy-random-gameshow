extends CharacterBody2D


@onready var player =  $"../CharacterBody2D"

@onready var slash =  $"../CharacterBody2D"

@onready var search_box = $SearchBox

@onready var hurt_box = $Area2D

@onready var move_timer: Timer = $MoveTimer

@onready var collider_box = $SearchBox

const DAMAGE = 1

var found_player = false

var health = 3  

var player_angle = 0

var can_move = true

var attack_count = 0

var attacking = false

var attack_diretion 

var direction = 0

func _physics_process(delta: float) -> void:
	direction = (player.global_position - global_position).normalized()
	velocity = velocity.move_toward(Vector2.ZERO,5.0)
	move()
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_angle = rad_to_deg((player.position - position).angle())
	
	attack_count = clamp(attack_count,0,3)
	
#player.pos.x < position.x:
			
func move():

	if found_player == true:		
		#QUADRANT 1
		if (player_angle <= 0 and player_angle >= -90 and attack_count != 3):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x += 250
					attack_count += 1
					print(attack_count)
				else:
					velocity.y -= 250
					attack_count += 1
					print(attack_count)
				
		#QUADRANT 2
		elif (player_angle <= -90 and player_angle >= -180 and attack_count != 3):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x -= 250
					attack_count += 1
					print(attack_count)
				else:
					velocity.y -= 250
					attack_count += 1
					print(attack_count)
				
			
		#QUADRANT 3
		elif (player_angle >= 90 and player_angle <= 180 and attack_count != 3):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x -= 250
					attack_count += 1
					print(attack_count)
				else:
					velocity.y += 250
					attack_count += 1
					print(attack_count)
				
			
		#QUADRANT 4
		elif (player_angle >= 0 and player_angle <= 90 and attack_count != 3):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x += 250
					attack_count += 1
					print(attack_count)
				else:
					velocity.y += 250
					attack_count += 1
					print(attack_count)
				
		
		
		if  (attack_count == 3 and can_move == true and attacking == false):
			print("yolo")
			attacking = true
			velocity += direction * 400.0
			$CollisionShape2D.disabled = true 
			
		if (attack_count == 3 and attacking == true):
			if velocity == Vector2.ZERO:
				attack_count = 0
				attacking = false
				$CollisionShape2D.disabled = false
			
func _on_search_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and found_player == false:
		found_player = true
		
	
func take_damage(amount):
	health -= amount
	
	if health <= 0:
		queue_free()
		


func _on_move_timer_timeout() -> void:
	can_move = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player") and $CollisionShape2D.disabled == true):
		print("jojo")
		body.take_damage(DAMAGE)
