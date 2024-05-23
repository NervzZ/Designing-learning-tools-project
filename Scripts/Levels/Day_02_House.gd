extends Node2D

func _ready():
	if GameState.boolStates["soldToArmyGuyNoRestrictions"]:
		GameManager.displayGameOver(Endings.soldToArmyNoConditionsEnding)
	
