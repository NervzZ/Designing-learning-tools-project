extends CharacterBody2D

var speed = 15000
var canMove = true
var touchHolding = false
var dragStart : Vector2
var moveDir : Vector2 = Vector2(0, 0)
var deadzone = 170

#Called when first loaded in memory
func _init():
	pass

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
					print("Left mouse button pressed")
			if event.is_released():
				touchHolding = false
				moveDir = Vector2(0, 0)
				print("Left mouse button released")

	
	if event is InputEventMouseMotion:
		if touchHolding:
			var pos = get_viewport().get_mouse_position()
			var dist = dragStart.distance_to(pos)
			if dist > deadzone:
				var direction : Vector2 = pos - dragStart
				moveDir = direction.normalized()
			else:
				moveDir = Vector2(0, 0)

#This is called at every frame the game renders, detal is time between each frame
func _process(delta):
	velocity = moveDir * speed

#This is called at every physical process tick (independent of game's framerate)
#Therefore you can expect delta to be constant
func _physics_process(delta):
	if canMove:
		set_velocity(velocity * delta)
		move_and_slide()
