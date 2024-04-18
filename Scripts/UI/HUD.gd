extends CanvasLayer

@onready var pauseButton : Button = get_node("PauseButton")

func _ready():
	pauseButton.pressed.connect(self._pause_pressed)
	
func _pause_pressed():
	GameManager.openMenu()
