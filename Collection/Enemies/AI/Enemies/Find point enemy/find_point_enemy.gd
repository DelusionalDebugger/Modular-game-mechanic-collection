extends CharacterBody2D

@onready var playerTracker: RayCast2D = $PlayerTracker

var chosenLocation : Vector2
var chosenPath : Vector2
var movementVelocity : int = 90
var player = null #Player in the scene will be stored here


func _ready() -> void:
	randomize()
	chosenLocation = Vector2(randi_range(-500,500),randi_range(-500,500))	#Can replace these ranges with screen or scene size needed and the integers with a constant to change range easier
	player = get_tree().get_first_node_in_group("Player")


func _physics_process(delta: float) -> void:
	randomMovement(delta)
	handlePlayer(player, delta)


func randomMovement(delta: float):
		chosenPath = (chosenLocation - global_position).normalized() #Determines path to chosen location
		global_position += movementVelocity * delta * chosenPath
	
		if global_position.distance_to(chosenLocation) < 3.0: #If distance to destination is less than 3.0
			randomize()
			chosenLocation = Vector2(randi_range(-500,500),randi_range(-500,500))


func handlePlayer(player:CharacterBody2D , delta:float):
	if player == null: #Exits function if player is not present in scene e.g if dead
		return
	else:
		playerTracker.look_at(player.global_position) #Raycast looks at player
		playerTracker.target_position = Vector2(50, 0)  #Set raycast length after rotation
		
		if playerTracker.is_colliding(): #If raycast collides
			var collisionResult = playerTracker.get_collider()
			if collisionResult == player:
				var trackPlayerLocation = (player.global_position - global_position).normalized() #Has tracking logic, should add attacking player logic
				position += trackPlayerLocation * delta * movementVelocity
			else:
				return
