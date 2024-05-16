extends Interactable

var not_finished_yet = Prompt.new(
	"Can't leave yet, still have work to do.",
	[{"text":"Ok","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var go_home = Prompt.new(
	"Should I go home?",
	[
		{"text":"Go home","method":func():LevelLoader.changeLevel(LevelLoader.day_02_home)},
		{"text":"Not yet","method":GameManager.closePrompt}
	],PromptSprites.playerTalker
)

func _trigger_action():
	if GameState.boolStates["TalkedAboutTechnologyRace"]:
		GameManager.displayPrompt(go_home)
	else:
		GameManager.displayPrompt(not_finished_yet)
