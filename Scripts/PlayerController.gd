extends CharacterBody2D

var speed = 27000
var canMove = true
var isMoving = false
var touchHolding = false
var dragStart : Vector2
var moveDir : Vector2 = Vector2(0, 0)
var deadzone = 75 #base for 1440p resolution
var footstepSound = preload("res://Assets/Sounds/SFX/footstep_concrete.ogg")
var viewport : Transform2D
var limitRight
var limitLeft
var edgeThreshold = 525.
var lastDir = Direction.DOWN

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

#Called when first loaded in memory
func _init():
	var width = 2560
	deadzone = deadzone * (float(width) / 2560)

func _ready():
	viewport = get_viewport_transform()
	limitLeft = 0
	limitRight = 2560
	var viewport : Viewport = get_viewport()
	viewport.canvas_transform.origin = Vector2(0, 0)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if !touchHolding:
					touchHolding = true
					dragStart = get_viewport().get_mouse_position()
					GameManager.joystick.position = dragStart
					
			if event.is_released():
				touchHolding = false
				moveDir = Vector2(0, 0)
				joystickHide()


	if event is InputEventMouseMotion:
		if touchHolding:
			var pos = get_viewport().get_mouse_position()
			var dist = dragStart.distance_to(pos)
			
			if dist > deadzone * 0.5:
				if !GameManager.joystick.visible:
					joystickShow()
					
			var direction : Vector2 = pos - dragStart
			if dist > deadzone:
				moveDir = direction.normalized()
				#-31 offset to center in the inner circle
				GameManager.innerStick.global_position = dragStart + moveDir * deadzone - Vector2(31, 31)
			else:
				#-31 offset to center in the inner circle
				GameManager.innerStick.global_position = pos - Vector2(31, 31)
				moveDir = Vector2(0, 0)

#This is called at every frame the game renders, detal is time between each frame
func _process(delta):
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		touchHolding = false
		
	velocity = moveDir * speed
	if moveDir != Vector2.ZERO:
		lastDir = getDir(moveDir)
			
	if velocity.is_zero_approx():
		match lastDir:
			Direction.UP:
				$AnimatedSprite2D.play("IdleUp")
			Direction.RIGHT:
				$AnimatedSprite2D.play("IdleRight")
			Direction.DOWN:
				$AnimatedSprite2D.play("IdleDown")
			Direction.LEFT:
				$AnimatedSprite2D.play("IdleLeft")
	else:
		match lastDir:
			Direction.UP:
				$AnimatedSprite2D.play("WalkUp")
			Direction.RIGHT:
				$AnimatedSprite2D.play("WalkRight")
			Direction.DOWN:
				$AnimatedSprite2D.play("WalkDown")
			Direction.LEFT:
				$AnimatedSprite2D.play("WalkLeft")
	
	#Camera edge detection
	var viewport : Viewport = get_viewport()

	#Move right
	if position.x > limitRight - edgeThreshold:
		var increment = abs(position.x - (limitRight - edgeThreshold))
		limitRight += increment
		limitLeft += increment
		viewport.canvas_transform.origin = viewport.canvas_transform.origin - Vector2(increment, 0)

	#Move left
	if position.x < limitLeft + edgeThreshold:
		var increment = abs(position.x - (limitLeft + edgeThreshold))
		limitRight -= increment
		limitLeft -= increment
		viewport.canvas_transform.origin = viewport.canvas_transform.origin + Vector2(increment, 0)

#This is called at every physical process tick (independent of game's framerate)
#Therefore you can expect delta to be constant
func _physics_process(delta):
	if canMove:
		set_velocity(velocity * delta)
		move_and_slide()
	
	if !velocity.is_zero_approx():
		
		# Time loop for footstep
		if $Timer.is_stopped():
			SoundManager.play_character_sound(
				footstepSound, 
				randf_range(0.8, 1.2), 
				-15) # footstep needs to be low in volume
			$Timer.start(0.33)
			
#Aproximates the given vector into its closest up, down, left, right direction
func getDir(dir: Vector2):
	# Normalize the vector to ignore its magnitude
	var normalized_vector = dir.normalized()

	# Compare the vector's direction
	if abs(normalized_vector.x) > abs(normalized_vector.y):
		# Closer to horizontal direction
		if normalized_vector.x > 0:
			return Direction.RIGHT
		else:
			return Direction.LEFT
	else:
		# Closer to vertical direction
		if normalized_vector.y > 0:
			return Direction.DOWN
		else:
			return Direction.UP

func joystickShow():
	var stick = GameManager.joystick
	stick.visible = true
	stick.position = dragStart
	
func joystickHide():
	GameManager.joystick.visible = false
