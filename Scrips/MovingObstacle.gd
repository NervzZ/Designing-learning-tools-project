extends AnimatableBody2D

@onready var remote = get_node("RemoteTransform2D")

var speed = 100
var direction = 1
var timer = 2
var count = 0.

func _physics_process(delta):
	count += delta
	if count >= timer:
		count = 0
		direction *= -1
		
	translate(Vector2(direction, 0) * delta * speed)
