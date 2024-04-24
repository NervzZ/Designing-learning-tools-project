extends CharacterBody2D

var speed = 15000
var canMove = true
var isMoving = false
var touchHolding = false
var dragStart : Vector2
var moveDir : Vector2 = Vector2(0, 0)
var deadzone = 75 #base for 1440p resolution
var footstepSound = preload("res://Assets/Sounds/SFX/footstep_concrete.ogg")

#Called when first loaded in memory
func _init():
	var width = DisplayServer.window_get_size().x
	deadzone = deadzone * (float(width) / 2560)

#Called when the object has been added to the scene
func _ready():
	print("Player spawned!")
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if !touchHolding:
					touchHolding = true
					dragStart = get_viewport().get_mouse_position()
					GameManager.joystick.position = dragStart
					print("Left mouse button pressed")
					
			if event.is_released():
				touchHolding = false
				moveDir = Vector2(0, 0)
				print("Left mouse button released")
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
	velocity = moveDir * speed
	if velocity.is_zero_approx():
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walk")
	
#This is called at every physical process tick (independent of game's framerate)
#Therefore you can expect delta to be constant
func _physics_process(delta):
	if canMove:
		set_velocity(velocity * delta)
		move_and_slide()
	
	if !velocity.is_zero_approx():
		
		# Sprite animation
		if moveDir.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif moveDir.x < 0:
			$AnimatedSprite2D.flip_h = true
			
		
		# Time loop for footstep
		if $Timer.is_stopped():
			SoundManager.play_character_sound(footstepSound, 
											randf_range(0.8, 1.2), 
											-20) # footstep needs to be low in volume
			$Timer.start(0.3)

func joystickShow():
	var stick = GameManager.joystick
	stick.visible = true
	stick.position = dragStart
	
func joystickHide():
	GameManager.joystick.visible = false
