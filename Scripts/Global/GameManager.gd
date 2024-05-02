extends Node

var dialogueScene : PackedScene = preload("res://UI/Dialogue.tscn")
var currentPrompt : Control
var click = preload("res://Assets/Sounds/SFX/click.wav")
var muted = false
var innerStick : Node

@onready var hud : CanvasLayer = preload("res://UI/HUD.tscn").instantiate()
@onready var pauseMenu : Control = preload("res://UI/PauseMenu.tscn").instantiate()
@onready var joystick : Control = preload("res://UI/Joystick.tscn").instantiate()
@onready var root = get_tree().get_root()

func _ready():
	root.add_child.call_deferred(hud)
	hud.add_child(joystick)
	innerStick = joystick.get_child(1)
	joystick.visible = false
	joystick.scale = Vector2(0.78, 0.78)
	hud.add_child(pauseMenu)
	hud.visible = false

func on_player_touched():
	displayPrompt(Dialogues.greenObstacleHit)

#Used to display a prompt on screen
func displayPrompt(prompt: Prompt):
	#overrides current prompt if present
	closePrompt()
	pause()
	
	hud.visible = false
	currentPrompt = dialogueScene.instantiate()
	var choiceBox: VBoxContainer = currentPrompt.get_node("OuterMargin/VBoxContainer/Panel/InnerMargin/VBoxContainer") 
	var text: RichTextLabel = choiceBox.get_node("Text") 
	var button: Button = choiceBox.get_node("Choice1").duplicate()
	var talker: TextureRect = currentPrompt.get_node("OuterMargin/VBoxContainer/Talker/InnerMargin/TextureRect")
	
	#remove placeholder buttons
	choiceBox.get_node("Choice1").queue_free()
	choiceBox.get_node("Choice2").queue_free()
	
	#Set text
	text.clear()
	text.add_text(prompt.text)
	
	#set talker texture
	talker.set_texture(prompt.talker)
	
	#add choices
	for choice in prompt.choices:
		var display = true
		var inverse = false
		
		if 'display' in choice:
			display = GameState.boolStates[choice['display']]
		if 'inverse' in choice:
			inverse = choice['inverse']
			
		if inverse:
			if !display:
				var btn: Button = button.duplicate()
				btn.text = choice["text"]
				btn.connect("pressed", choice["method"])
				btn.connect("pressed", _playClick)
				choiceBox.add_child(btn)
		else:
			if display:
				var btn: Button = button.duplicate()
				btn.text = choice["text"]
				btn.connect("pressed", choice["method"])
				btn.connect("pressed", _playClick)
				choiceBox.add_child(btn)
		
	root.add_child(currentPrompt)
	
func closePrompt():
	if currentPrompt != null:
		currentPrompt.queue_free()
		hud.visible = true
		unPause()
	
func _playClick():
	SoundManager.play_ui(click)

#used to pause runtime of the game (stops frames and physical simulation)
func pause():
	get_tree().paused = true
	
func unPause():
	get_tree().paused = false

func openMenu():
	pauseMenu.visible = true
	pause()

func toggleSound():
	#TODO implement sound toggling (used in menu to mute/unmute sounds)
	muted = !muted

#closes the game
func quit():
	get_tree().quit()
