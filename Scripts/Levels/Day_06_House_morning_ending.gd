extends Node2D

func _ready():
	if GameState.mistakes_made==0:
		GameManager.displayGameOver(Endings.perfectEnding)
	else:
		GameManager.displayGameOver(Endings.okEnding())

