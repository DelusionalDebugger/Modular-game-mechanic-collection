extends PathFollow2D

const SPEED : float = 0.5
var endPoint = 0.99

func _process(delta: float) -> void:
	loop_movement(delta)

func loop_movement(delta):
	if progress_ratio < endPoint:
		progress_ratio += delta * SPEED
		endPoint = 0.99
	
	elif progress_ratio > endPoint:
		progress_ratio += delta * SPEED * -1 #To reverse the direction the enemy travels
		endPoint = 0.01
