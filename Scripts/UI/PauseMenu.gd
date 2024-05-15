extends Control

@onready var soundButton : Button = get_node("PanelContainer/MarginContainer/VBoxContainer/Sound")
@onready var resumeButton : Button = get_node("PanelContainer/MarginContainer/VBoxContainer/Resume")
@onready var quitButton : Button = get_node("PanelContainer/MarginContainer/VBoxContainer/Quit")

func _ready():
	#used to make this node always process (aka not pausable)
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	visible = false
	soundButton.pressed.connect(self._sound_pressed)
	resumeButton.pressed.connect(self._resume_pressed)
	quitButton.pressed.connect(self._quit_pressed)
	
func _sound_pressed():
	GameManager.toggleSound()
	if GameManager.muted:
		soundButton.text = "Sound : Off"
	else:
		soundButton.text = "Sound : On"

func _resume_pressed():
	GameManager.unPause()
	visible = false

func _quit_pressed():
	GameManager.returnToMainMenu()
	_resume_pressed()
