extends Node

#add states here if needed to be passed by reference and not value
var boolStates = {
	"SaidYesOnExamplePrompt": false,
	"TalkedAboutTechnologyRace" : false,
	"TalkedAboutRisks" : false, #optional stuff
	"InvestigatedRisks" : false, #optional stuff
	"KilledAnimals" : false,#optinal stuff, when testing the teleporter prematurely
	"PhonedWithArmy" : false,
	"startedTalingWithArmyguy" : false,
	"finishedTalkingWithArmyguy" : false,
	"soldToArmyGuyNoRestrictions": false,
	"soldToArmyGuyWithRestrictions": false,
	"refusedArmyGuy" : false,
	"discussedArmyGuyWithLab" : false,
	"talkedToCoproration" : false,
	"soldToCorporation" : false,
	"refusedToSellToCorporation":false,
	"talkedToFriendsOptionalStealing":false,
	"misusedForPersonalGain":false,
	"didNotMisuseForPersonalGain":false,
	"admittedIssuesToAuthority":false,
	"talkedToAuthority":false,
	"agreeToSustainability":false,
	"talkedAboutSustainability":false,
	"didntSellToArmyAndFoundOutAboutStability":false, #<-workaround for boolean logic
	
	"always":true,
}

var mistakes_made=0
