extends Node

################################################################################
# Welcome message
################################################################################
func welcomeToLabDialogue(): # <- Call this for welcome message
	GameManager.displayPrompt(DialogueLabDay01.welcomeToLab)
	
var welcomeToLab = Prompt.new(  # said by you (or narrator?)
	"We are about to make a breakthrough in Teleportation.",
	[
		{"text":"Ok", "method" : self.welcomeToLab_ok}
	],
	PromptSprites.playerTalker
)
var welcomeToLabStartWork = Prompt.new(  # said by you
	"Allright, I have a dream. Time to work to make it a reality!",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)

func welcomeToLab_ok():
	GameManager.closePrompt()
	GameManager.displayPrompt(welcomeToLabStartWork)


################################################################################
# First discussion with NPC (info about time limits and others getting close)
# Discussion with `scientist01Talker`
################################################################################
func dicussTechRace():  # <- CALL this for dialogue
	if GameState.boolStates["TalkedAboutTechnologyRace"]:
		GameManager.displayPrompt(firstDiscussionWithNPC_after)
	else:
		GameManager.displayPrompt(firstDiscussionWithNPC)

func firstDiscussionWithNPC_ok():
	GameManager.closePrompt()
	GameState.boolStates["TalkedAboutTechnologyRace"] = true
	GameManager.displayPrompt(firstDiscussionWithNPC_techRace)
var firstDiscussionWithNPC = Prompt.new( # said by scientist friend
	"Hey! Glad you stopped by, we really need to hurry up our development,
	 otherwise the other teams are gonna beat us to the first functional teleporter!",
	[
		{"text":"I know, but we're super close now","method": self.firstDiscussionWithNPC_ok}
	],
	PromptSprites.scientist01Talker
)
var firstDiscussionWithNPC_techRace = Prompt.new(  # said by scientist friend
	"I sure hope so, this is turning into a real technology race...",
	[
		{"text":"I know, but we're super close now","method": GameManager.closePrompt}
	],
	PromptSprites.scientist01Talker
)
var firstDiscussionWithNPC_after= Prompt.new( 
	"Glad we talked about that.",
	[
		{"text":"Leave","method": GameManager.closePrompt}
	],
	PromptSprites.scientist01Talker
)


