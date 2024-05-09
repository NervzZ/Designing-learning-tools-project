extends Node




################################################################################
# Wake up message (after dream or sth)
################################################################################
func wake_up(): # <- Call this for welcome message
	GameManager.displayPrompt(DreamPrompt)
	
var DreamPrompt = Prompt.new(  # said by you (or narrator?)
	"Some strange dream you had, maybe some ideas or musings... TODO",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)


################################################################################
# Phone call !
################################################################################
func discuss_entry_army_phonecall():
	GameState.boolStates["PhonedWithArmy"] = true
	GameManager.displayPrompt(armyPhoneCall)

var armyPhoneCall = Prompt.new(
	"Good day. This is [Army Representative] calling from the
military procurement department. I wanted to call you to express our interest in
your teleporter prototype. There will be someone coming by your lab today to
discuss possible collaborations. Good day",
[{"text":"Leave","method":GameManager.closePrompt}],
PromptSprites.phone
)



################################################################################
# Maybe have some stuff with wife and kid?
# maybe have that stuff in specific file cuz its not really level dependent...
################################################################################
