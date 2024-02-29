extends CharacterBody2D

var speed = 15000

#Called when first loaded in memory
func _init():
	pass

#Called when the object has been added to the scene
func _ready():
	print("Player spawned!")

#This is called at every frame the game renders, detal is time between each frame
func _process(delta):
	pass

#This is called at every physical process tick (independent of game's framerate)
#Therefore you can expect delta to be constant
func _physics_process(delta):
	get_input()
	set_velocity(velocity * delta)
	move_and_slide()

func get_input():
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_dir.normalized() * speed
