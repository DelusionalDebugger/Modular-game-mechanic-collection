extends CharacterBody2D

var chosenLocation : Vector2
var movementVelocity : int = 90
var targetLocation : Vector2

func _ready() -> void:
	randomize()
	chosenLocation = Vector2(randi_range(-2000,2000),randi_range(-2000,2000))	#Can replace these ranges with screen or scene size needed 

func _physics_process(delta: float) -> void:
	targetLocation = (chosenLocation - global_position).normalized()
	global_position += movementVelocity * delta * targetLocation
	print(chosenLocation)
	
	if global_position.distance_to(chosenLocation) < 3.0: #If distance to destination is less than 3.0
		randomize()
		chosenLocation = Vector2(randi_range(-2000,2000),randi_range(-2000,2000))
