extends CharacterBody2D
class_name enemy

@onready var player =  $"../CharacterBody2D"

@onready var slash =  $"../CharacterBody2D"

@onready var search_box = $SearchBox

var found_player = false

var pawn_health = 3  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if found_player == true:
		if player.pos.x < position.x:
			print("owow") 
		
	
func _on_search_box_body_entered(body: Node2D) -> void:
	if body is player and found_player == false:
		found_player = true
		print(found_player)
		
