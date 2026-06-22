extends Area2D

func _ready() -> void:
	#hides slash
	visible = false
	$CollisionShape2D.disabled = true
	
func play(player_position: Vector2, mouse_position: Vector2) -> void:
	#hehe, I do angle Calcs （￣︶￣）↗　
	var angle = player_position.angle_to_point(mouse_position)
	
	#hoho, I put slash around player  (^///^)
	var offset = Vector2(30, 0).rotated(angle)
	global_position = player_position + offset
	
	#rotates the slash 😁
	rotation = angle
	
	#plays animation
	visible = true
	$AnimatedSprite2D.play("slash")
	
func _on_animated_sprite_2d_animation_finished() -> void:
	#hide & disable
	visible = false
	$CollisionShape2D.disabled = true
	print("yayay")
	
