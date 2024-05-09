extends Node




################################################################################
# Welcome message
################################################################################
func welcomeToLabDialogue(): # <- Call this for welcome message
	GameManager.displayPrompt(DialogueLabDay01.welcomeToLab)
	
var welcomeToLab = Prompt.new(
	"We are about to make a breakthrough in Teleportation.",
	[
		{"text":"Ok", "method" : self.welcomeToLab_ok}
	]
)
var welcomeToLabStartWork = Prompt.new(
	"Allright, I have a dream. Time to work to make it a reality!",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	]
)

func welcomeToLab_ok():
	GameManager.closePrompt()
	GameManager.displayPrompt(welcomeToLabStartWork)


################################################################################
# First discussion with NPC
################################################################################
func dicussTechRace():  # <- Call this for dialogue
	GameManager.displayPrompt(firstDiscussionWithNPC)
	
var firstDiscussionWithNPC = Prompt.new(
	"Hey! Glad you stopped by, we really need to hurry up our development,
	 otherwise the other teams are gonna beat us to the first functional teleporter!",
	[
		{"text":"I know, but we're super close now","method": self.firstDiscussionWithNPC_ok}
	]
)
var firstDiscussionWithNPD_techRace = Prompt.new(
	"I sure hope so, this is turning into a real technology race...",
	[
		{"text":"I know, but we're super close now","method": GameManager.closePrompt}
	]
)
func firstDiscussionWithNPC_ok():
	GameManager.closePrompt()
	GameState.boolStates["TalkedAboutTechnologyRace"] = true
	GameManager.displayPrompt(firstDiscussionWithNPD_techRace)
