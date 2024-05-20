extends Control

@onready var next : Button = get_node("PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/Button")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.hud.visible = false
	next.pressed.connect(self._next_pressed)

func _next_pressed():
	LevelLoader.changeLevel(LevelLoader.controls)
