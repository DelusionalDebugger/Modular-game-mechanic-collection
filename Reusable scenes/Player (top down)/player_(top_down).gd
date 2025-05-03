extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite

const SPEED : int = 150

var isLeft

func _physics_process(delta : float) -> void:
	
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	velocity = direction * SPEED
	
	isLeft = velocity.x < 0
	sprite.flip_h = isLeft

	move_and_slide()
