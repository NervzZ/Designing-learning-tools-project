extends Interactable



@export
var destination_scene:PackedScene

@export 
var allow="always"
@export
var continue_text = "Continue?"
@export
var cant_continue_text = "Not done yet"

var not_finished_yet = Prompt.new(
	cant_continue_text,
	[{"text":"Ok","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var go_home = Prompt.new(
	continue_text,
	[
		{"text":"yes","method":change_scene},
		{"text":"No","method":GameManager.closePrompt}
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
