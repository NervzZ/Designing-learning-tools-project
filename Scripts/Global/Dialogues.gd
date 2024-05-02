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
	hello world is way too boring at this point. Click Ok if you understood!",
	[
		{"text": "Ok!", "method": self.welcomePrompt_a},
		{"text": "Nope", "method": self.welcomePrompt_b}
	]
)

func welcomePrompt_a():
	GameManager.closePrompt()
	GameState.boolStates["SaidYesOnExamplePrompt"] = true
	GameManager.displayPrompt(testPropmptConditional)
	
func welcomePrompt_b():
	GameManager.closePrompt()
	GameState.boolStates["SaidYesOnExamplePrompt"] = false
	GameManager.displayPrompt(testPropmptConditional)

#Example of how to use conditions with 'display' and 'inverse' optiomal members.
#Look at welcomePrompt to understand how to change boolean states
#If inverse = true, it will invert the display logic. E.g if display = false but inverse = true then we display
var testPropmptConditional = Prompt.new(
	"Did you click ok?",
	[
		{"text": "Yes", "method": self.testPropmptConditional_close, 'display': "SaidYesOnExamplePrompt"},
		{"text": "Nope", "method": self.testPropmptConditional_close, 'display': "SaidYesOnExamplePrompt", 'inverse': true}
	]
)

func testPropmptConditional_close():
	GameManager.closePrompt()
	
	
var talkToTestNPCPrompt = Prompt.new(
	"Hello, this is a test dialog !",
	[
		{"text": "Ok!", "method": self.talkToTestNPCPrompt_ok}
	],
	PromptSprites.exampleTalker
)

func talkToTestNPCPrompt_ok():
	print("Close dialog with NPC")
	GameManager.closePrompt()
