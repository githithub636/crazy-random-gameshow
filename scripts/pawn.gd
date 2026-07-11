extends CharacterBody2D
class_name enemy

@onready var player =  $"../CharacterBody2D"

@onready var slash =  $"../CharacterBody2D"

@onready var search_box = $SearchBox

@onready var move_timer: Timer = $MoveTimer

var found_player = false

var health = 3  

var player_angle = 0

var can_move = true

var attack_count = 0

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Vector2.ZERO,5.0)
	move()
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_angle = rad_to_deg((player.position - position).angle())
	print(player_angle)
	
#player.pos.x < position.x:
			
func move():

	if found_player == true:		
		#QUADRANT 1
		if (player_angle <= 0 and player_angle >= -90):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x += 250
				else:
					velocity.y -= 250
				attack_count +=1
				
		#QUADRANT 2
		elif (player_angle <= -90 and player_angle >= -180):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x -= 250
				else:
					velocity.y -= 250
				attack_count +=1
				
			
		#QUADRANT 3
		elif (player_angle >= 90 and player_angle <= 180):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x -= 250
				else:
					velocity.y += 250
				attack_count +=1
				
			
		#QUADRANT 4
		elif (player_angle >= 0 and player_angle <= 90):
			if can_move == true:
				move_timer.start()
				can_move = false
				if randf() < 0.5:
					velocity.x += 250
				else:
					velocity.y += 250
				attack_count +=1
				
	
func _on_search_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and found_player == false:
		found_player = true
		print(found_player)
	
func take_damage(amount):
	health -= amount
	print("hello")
	if health <= 0:
		queue_free()
		


func _on_move_timer_timeout() -> void:
	can_move = true
