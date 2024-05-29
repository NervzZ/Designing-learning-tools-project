extends Node

################################################################################
# Wake up message (after dream or sth)
################################################################################
func wake_up_day02(): # <- Call this for welcome message
	GameManager.displayPrompt(DreamPromptDay02)

var DreamPromptDay02 = Prompt.new(  # said by you (or narrator?)
	"You wake up, feeling anxious... You had a strange dream but you don't
remember it.",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)


func wake_up_day03():
	GameManager.displayPrompt(DreamPromptDay03)
var DreamPromptDay03 = Prompt.new(
	"You feel well rested after a grat night's sleep",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)


func wake_up_day04():
	GameManager.displayPrompt(DreamPromptDay04)
var DreamPromptDay04 = Prompt.new(
	"You feel well rested after a grat night's sleep",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)

func wake_up_day05():
	GameManager.displayPrompt(DreamPromptDay05)
var DreamPromptDay05 = Prompt.new(
	"You feel well rested after a grat night's sleep",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)
