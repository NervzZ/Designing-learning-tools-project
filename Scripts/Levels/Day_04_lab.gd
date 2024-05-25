extends Node2D

func _ready():
	if GameState.boolStates["misusedForPersonalGain"]:
		GameManager.displayGameOver(Endings.personalGainWithFriends)
