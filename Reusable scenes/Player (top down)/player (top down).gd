extends CharacterBody2D

const SPEED : int = 150

var player_state

func _physics_process(delta : float) -> void:
	
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	velocity = direction * SPEED

	move_and_slide()
