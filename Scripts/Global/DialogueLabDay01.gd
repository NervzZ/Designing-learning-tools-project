extends Node




################################################################################
# Welcome message
################################################################################
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
# Firs discussion with NPC
################################################################################



