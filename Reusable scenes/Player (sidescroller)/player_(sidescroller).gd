extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite

const SPEED : int = 300.0
const JUMP_VELOCITY : int = -650.0
const JUMP_BUFFER : float = 0.5

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isLeft

func _physics_process(delta : float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	handle_jump(delta)
	
	isLeft = velocity.x < 0
	sprite.flip_h = isLeft
	
func handle_jump(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if not is_on_floor() and velocity.y > 0:
		velocity.y += gravity * delta * 1.5

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("jump") == true and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
