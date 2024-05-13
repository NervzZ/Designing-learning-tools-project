extends Interactable #Extend the Interactable like so, you now inherits the methods of Interactable

#do not override the _ready() function, instead, override _ready_additional():
func _ready_additional():
	print("I happen additionally to my parent _ready() code")

#This is the method you override that will be triggered on interaction click
func _trigger_action():
	GameManager.displayPrompt(Dialogues.testScientistPrompt)
