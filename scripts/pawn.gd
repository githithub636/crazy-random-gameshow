extends CharacterBody2D
class_name enemy

@onready var player =  $"../CharacterBody2D"

@onready var slash =  $"../CharacterBody2D"

@onready var search_box = $SearchBox

var found_player = false

var health = 3  

var player_angle = 0

var can_move = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_angle = rad_to_deg((player.position - position).angle())
	print(player_angle)
	move()
	move_and_slide()
#player.pos.x < position.x:
			
func move():
	#QUADRANT 1
	if (player_angle <= 0 and player_angle >= -90):
		print(1)
		if can_move == true:
			velocity.x += 100
			
			can_move = false
			
	#QUADRANT 2
	elif (player_angle <= -90 and player_angle >= -180):
		print(2)
		
	#QUADRANT 3
	elif (player_angle >= 90 and player_angle <= 180):
		print(3)
		
	#QUADRANT 4
	elif (player_angle >= 0 and player_angle <= 90):
		print(4)
	
func _on_search_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and found_player == false:
		found_player = true
		print(found_player)
	
func take_damage(amount):
	health -= amount
	print("hello")
	if health <= 0:
		queue_free()
		
