extends Interactable



@export
var destination_scene:PackedScene

@export 
var allow="always"

var not_finished_yet = Prompt.new(
	"Not done yet",
	[{"text":"Ok","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var go_home = Prompt.new(
	"Read to continue?",
	[
		{"text":"yes","method":change_scene},
		{"text":"Not yet","method":GameManager.closePrompt}
	],PromptSprites.playerTalker
)

func change_scene():
	GameManager.closePrompt()
	LevelLoader.changeLevel(destination_scene)

func _trigger_action():
	if GameState.boolStates[allow]:
		GameManager.displayPrompt(go_home)
	else:
		GameManager.displayPrompt(not_finished_yet)
