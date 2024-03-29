extends Control

@onready var startButton : Button = get_node("MarginContainer/VBoxContainer/StartButton")
@onready var exitButton : Button = get_node("MarginContainer/VBoxContainer/ExitButton")

func _ready():
	startButton.pressed.connect(self._start_pressed)
	exitButton.pressed.connect(self._exit_pressed)

func _start_pressed():
	LevelLoader.changeLevel(LevelLoader.firstLevel)

func _exit_pressed():
	GameManager.quit()
