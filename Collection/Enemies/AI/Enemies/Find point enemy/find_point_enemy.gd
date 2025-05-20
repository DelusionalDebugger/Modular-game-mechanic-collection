extends CharacterBody2D

@onready var playerTracker: RayCast2D = $PlayerTracker

var chosenLocation : Vector2
var targetLocation : Vector2
var movementVelocity : int = 90

var player = null #Player in the scene will be stored here

func _ready() -> void:
	randomize()
	chosenLocation = Vector2(randi_range(-2000,2000),randi_range(-2000,2000))	#Can replace these ranges with screen or scene size needed 
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	randomMovement(delta)
	findPlayer(player)

func randomMovement(delta: float):
		targetLocation = (chosenLocation - global_position).normalized()
		global_position += movementVelocity * delta * targetLocation
	
		if global_position.distance_to(chosenLocation) < 3.0: #If distance to destination is less than 3.0
			randomize()
			chosenLocation = Vector2(randi_range(-2000,2000),randi_range(-2000,2000))

func findPlayer(player):
	if player == null:
		return
	else:
		playerTracker.target_position = to_local(player.global_position)
