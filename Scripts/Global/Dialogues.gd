extends Node

# Example of adding choices to a prompt
var greenObstacleHit = Prompt.new(
	"You just hit the green obstacle! What do you want to do?",
	[
		{"text": "Continue playing", "method": self.greenObstacleHit_a},
		{"text": "Quit the game", "method": self.greenObstacleHit_b}
	]
)

#No switch cases in GDScript so it was cleaner and easier to read like this
func greenObstacleHit_a():
	print("Continue playing")
	GameManager.closePrompt()

func greenObstacleHit_b():
	print("Quit the game")
	GameManager.quit()

var welcomePrompt = Prompt.new(
	"Hello and welcome to the M-Project! This is an example prompt for testing purposes but saying
	hello world is way too boring at this point.",
	[
		{"text": "Ok!", "method": self.welcomePrompt_a}
	]
)

func welcomePrompt_a():
	GameManager.closePrompt()
	
var talkToTestNPCPrompt = Prompt.new(
	"Hello, this is a test dialog !",
	[
		{"text": "Ok!", "method": self.talkToTestNPCPrompt_ok}
	]
)

func talkToTestNPCPrompt_ok():
	print("Close dialog with NPC")
	GameManager.closePrompt()
