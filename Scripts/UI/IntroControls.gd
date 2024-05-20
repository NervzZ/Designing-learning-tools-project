extends Control

@onready var play : Button = get_node("PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/Button")

# Called when the node enters the scene tree for the first time.
func _ready():
	play.pressed.connect(self._play_pressed)

func _play_pressed():
	GameManager.hud.visible = true
	LevelLoader.changeLevel(LevelLoader.day_01_lab)
