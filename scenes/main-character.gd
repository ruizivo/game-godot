extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $Sprite2D
@onready var player = $player

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
 
var isLeft = false
var isInDoubleJump = false



func _physics_process(delta):
	# Animation
	if abs(velocity.x) > 1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
		
			
		if Input.is_action_just_pressed("jump") and not isInDoubleJump:
			velocity.y = JUMP_VELOCITY
			isInDoubleJump = true;
			player.play()
	else: 
		isInDoubleJump = false;
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		player.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 22)

	move_and_slide()
	

	if velocity.x == 0:
		sprite_2d.flip_h = isLeft
	elif velocity.x < 0:
		sprite_2d.flip_h = true
		isLeft = true
	else:
		sprite_2d.flip_h = false
		isLeft = false
