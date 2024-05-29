extends Control

@onready var startButton : Button = get_node("MarginContainer/VBoxContainer/StartButton")
@onready var creditsButton: Button = get_node("MarginContainer/VBoxContainer/Credits")
var click = preload("res://Assets/Sounds/SFX/click.wav")

func _ready():
	GameManager.hud.visible = false
	startButton.pressed.connect(self._start_pressed)
	creditsButton.pressed.connect(self._credits_pressed)
	
func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		_exit_pressed()
	if Input.is_action_just_pressed("StartTestLevel"):
		_test_level_pressed()
	
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

func _credits_pressed():
	LevelLoader.changeLevel(LevelLoader.credits)
	SoundManager.play_ui(click)
