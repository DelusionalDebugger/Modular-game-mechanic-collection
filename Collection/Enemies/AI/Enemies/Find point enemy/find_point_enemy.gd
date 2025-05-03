extends CharacterBody2D

@onready var pointTracker: RayCast2D = $PointTracker

var chosenLocation : Vector2
var movementVelocity : int = 30
var targetLocation : Vector2

func _ready() -> void:
	targetLocation = Vector2(randi_range(-2000,2000),randi_range(-2000,2000))	#Can replace these ranges with screen or scene size needed 

func _physics_process(delta: float) -> void:
	pointTracker.look_at(chosenLocation)
	targetLocation = (chosenLocation - global_position).normalized()
	position += movementVelocity * delta * targetLocation
	
	if targetLocation == Vector2(0,0):
		targetLocation = Vector2(randi_range(-2000,2000),randi_range(-2000,2000))
