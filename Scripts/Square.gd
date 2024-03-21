extends AnimatableBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.body_entered.connect(Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("Player"):
		GameManager.on_player_touched()
