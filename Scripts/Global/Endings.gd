extends Node

# Example of adding choices to a prompt
var testEnding = Ending.new(
	"The End",
	"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac ex nec neque pharetra volutpat eu in turpis. Morbi non aliquet elit, sit amet dapibus elit. Integer in nisl diam. Nunc euismod ultrices tincidunt. Nam ut augue mauris. Suspendisse potenti. Nulla iaculis leo eu velit varius pharetra. Cras aliquam sit amet purus et cursus. Nunc dapibus lorem ac purus commodo ultrices non at dolor. Proin fringilla ultricies dui. Quisque pellentesque, velit et tristique maximus, urna diam rutrum velit, eget convallis elit dui at nulla. Nunc laoreet nunc ut molestie cursus.

Mauris aliquet, magna vitae rutrum vehicula, enim lacus lobortis quam, nec volutpat urna massa eu erat. Vestibulum at lorem vitae mi tincidunt vestibulum at quis neque. Donec mattis nulla eu gravida ultricies. Nunc ac quam nulla. Vestibulum tincidunt massa vitae urna porta lacinia. Nullam eget arcu vel urna maximus porttitor eget malesuada libero. Pellentesque elementum eget ligula dictum sodales.",
_testEndingAction
)



var soldToArmyNoConditionsEnding = Ending.new( #instant
	"The End",
	"The military has acquired your teleporter, and after a few months of secrecy, discovered"+
	" that not only can it be used for logistics,"+
	"but can deliver explosives, or agents anywhere in the world in an instant.\n\n"+
	"Unfortunately, no government regulations were put in place to stop this.\n\n"+
	"Also, every now and again, an entire platoon disappears inside the teleporter and no one knows why...",
	restartGame
)


var personalGainWithFriends = Ending.new( #instant
	"The End",
	"The police are here to arrest you for stealing large sums of money. They also have"+
	" a few questions on how you managed to get in and out of the bank...",
	restartGame
)


var didntRegulateStuff = Ending.new(
	"The End",
	"There were some issues with your teleporter. Your friend tried to warn you."+
	"The government attempted to investigate and regulate its usage.\n" +
	"In the end it was to no avail and people were hurt.",
	restartGame
)


var perfectEnding = Ending.new(
	"The End",
	"Congratulations! After all the difficulties, you now unveil your teleporter to the public!",
	restartGame
)

func okEnding():
	var string_to_display =( "Congratulations! After all the difficulties, you now unveil your teleporter to the public!"+
		"\nThere are however some things bothering you...\n"+
		("You gave the teleporter to the army and you imposed restrictions, but would that really stop them or might they just do things secretly?\n"
		if GameState.boolStates["soldToArmyGuyWithRestrictions"] else "") +
		("You don't actually own your own invention anymore... and the corporations might 'legally' collect user data without anyone knowing...\n"
		if GameState.boolStates["soldToCorporation"] else "") +
		("In the end, is there really an overseight on the usage of the teleporter? If the governement cannot regulate the teleporter, what's stopping anyone from misusing it?\n"
		 if not GameState.boolStates["admittedIssuesToAuthority"] else "")+
		("Maybe it was too soon? The teleporter consume so much energy that it will need be powered by nuclear and fossil fuels. Did you really want that?\n"
		 if not GameState.boolStates["agreeToSustainability"] else ""))
	var kkending = Ending.new(
		"The End",
		string_to_display,
		 restartGame
	)
	return kkending


func restartGame():
	for key in GameState.boolStates:
		GameState.boolStates[key]=false
	GameState.boolStates["always"]=true
	GameManager.closeGameOver()
	GameManager.returnToMainMenu()

#No switch cases in GDScript so it was cleaner and easier to read like this
func _testEndingAction():
	GameManager.closeGameOver()
	GameManager.returnToMainMenu()


