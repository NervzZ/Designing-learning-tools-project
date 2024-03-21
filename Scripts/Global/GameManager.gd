extends Node

var dialogueScene: PackedScene = preload("res://UI/Dialogue.tscn")
var currentPrompt: Control

@onready var root = get_tree().get_root()

func on_player_touched():
	displayPrompt(Dialogues.greenObstacleHit)

#Used to display a prompt on screen
func displayPrompt(prompt: Prompt):
	#overrides current prompt if present
	closePrompt()
	
	currentPrompt = dialogueScene.instantiate()
	var choiceBox: VBoxContainer = currentPrompt.get_node("OuterMargin/Panel/InnerMargin/VBoxContainer") 
	var text: RichTextLabel = choiceBox.get_node("Text") 
	var button: Button = choiceBox.get_node("Choice1").duplicate()
	
	#remove placeholder buttons
	choiceBox.get_node("Choice1").queue_free()
	choiceBox.get_node("Choice2").queue_free()
	
	#Set text
	text.clear()
	text.add_text(prompt.text)
	
	#add choices
	for choice in prompt.choices:
		var btn: Button = button.duplicate()
		btn.text = choice["text"]
		btn.connect("pressed", choice["method"])
		choiceBox.add_child(btn)
		
	root.add_child(currentPrompt)
	
func closePrompt():
	if currentPrompt != null:
		currentPrompt.queue_free()

#closes the game
func quit():
	get_tree().quit()
