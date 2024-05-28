extends Interactable #Extend the Interactable like so, you now inherits the methods of Interactable

#do not override the _ready() function, instead, override _ready_additional():
func _ready_additional():
	pass

#This is the method you override that will be triggered on interaction click
func _trigger_action():
	if GameState.boolStates["talkedToAuthority"]:
		if GameState.boolStates["admittedIssuesToAuthority"]:
			GameManager.displayPrompt(DialogueNewsPaper.day05IfRgulate)
		else:
			GameManager.displayPrompt(DialogueNewsPaper.day05IfNotRgulate)
	elif GameState.boolStates["misusedForPersonalGain"]:
		GameManager.displayPrompt(DialogueNewsPaper.day04IfDidDumbShit)
	elif GameState.boolStates["talkedToCoproration"]:
		if GameState.boolStates["soldToCorporation"]:
			GameManager.displayPrompt(DialogueNewsPaper.day04IfSoldToCorporations)
		else:
			GameManager.displayPrompt(DialogueNewsPaper.day04IfNotSoldToCorporations)
	elif GameState.boolStates["finishedTalkingWithArmyguy"]:
		if GameState.boolStates["refusedArmyGuy"]:
			GameManager.displayPrompt(DialogueNewsPaper.day03IfNotArmy)
		else:
			GameManager.displayPrompt(DialogueNewsPaper.day03IfSoldArmy)
	else:
		GameManager.displayPrompt(DialogueNewsPaper.day02Generalities)
