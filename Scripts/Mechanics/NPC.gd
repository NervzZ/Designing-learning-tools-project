extends Interactable

class_name NPC

@export var direction: Direction = Direction.DOWN

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

func _process(delta):
	_additional_process()
	match direction:
		Direction.UP:
			sprite.play("IdleUp")
		Direction.RIGHT:
			sprite.play("IdleRight")
		Direction.DOWN:
			sprite.play("IdleDown")
		Direction.LEFT:
			sprite.play("IdleLeft")

#override this if you need to add anything to the process function
func _additional_process():
	pass
