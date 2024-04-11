extends Control

@onready var startButton : Button = get_node("MarginContainer/VBoxContainer/StartButton")
@onready var exitButton : Button = get_node("MarginContainer/VBoxContainer/ExitButton")
var click = preload("res://Assets/Sounds/SFX/click.wav")

func _ready():
	startButton.pressed.connect(self._start_pressed)
	exitButton.pressed.connect(self._exit_pressed)

func _start_pressed():
	LevelLoader.changeLevel(LevelLoader.firstLevel)
	SoundManager.play_ui(click)

func _exit_pressed():
	GameManager.quit()
	SoundManager.play_ui(click)
