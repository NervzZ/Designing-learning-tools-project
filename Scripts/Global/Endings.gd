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
	"Also, every now and again, an entire platoon disappears inside the teleporter and no one knows why...",
	restartGame
)





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

