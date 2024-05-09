extends Node

#add states here if needed to be passed by reference and not value
var boolStates = {
	"SaidYesOnExamplePrompt": false,
	"TalkedAboutTechnologyRace" : false,
	"TalkedAboutRisks" : false, #optional stuff
	"InvestigatedRisks" : false, #optional stuff
	"KilledAnimals" : false,#optinal stuff, when testing the teleporter prematurely
	"PhonedWithArmy" : false,
}

var mistakes_made=0
