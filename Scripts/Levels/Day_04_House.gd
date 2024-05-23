extends Node2D

func _ready():
	#DialogueWakeUpHome.wake_up_day04()
	if GameState.boolStates["soldToArmyGuyNoRestrictions"] and not GameState.boolStates["admittedIssuesToAuthority"]:
		GameManager.displayGameOver(Endings.soldToArmyNoConditionsEnding)
	pass

