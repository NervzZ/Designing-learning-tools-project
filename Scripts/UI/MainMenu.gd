extends Control

@onready var startButton : Button = get_node("MarginContainer/VBoxContainer/StartButton")
@onready var exitButton : Button = get_node("MarginContainer/VBoxContainer/ExitButton")
@onready var testLevelButton : Button = get_node("MarginContainer/VBoxContainer/TestLevelButton")
var click = preload("res://Assets/Sounds/SFX/click.wav")

func _ready():
	GameManager.hud.visible = false
	startButton.pressed.connect(self._start_pressed)
	exitButton.pressed.connect(self._exit_pressed)
	testLevelButton.pressed.connect(self._test_level_pressed)
	
func _start_pressed():
	LevelLoader.changeLevel(LevelLoader.intro)
	SoundManager.play_ui(click)
	GameManager.hud.visible = true

func _exit_pressed():
	GameManager.quit()
	SoundManager.play_ui(click)

func _test_level_pressed():
	LevelLoader.changeLevel(LevelLoader.testLevel)
	SoundManager.play_ui(click)
	GameManager.hud.visible = true
