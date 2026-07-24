extends CharacterBody2D


@onready var player =  $"../CharacterBody2D"

@onready var slash =  $"../CharacterBody2D"

var direction = Vector2.ZERO




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (player)
