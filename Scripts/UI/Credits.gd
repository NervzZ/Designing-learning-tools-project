extends Control

@onready var next : Button = get_node("PanelContainer/MarginContainer/Button")
# Called when the node enters the scene tree for the first time.
func _ready():
	next.pressed.connect(self._next_pressed)

func _next_pressed():
	LevelLoader.changeLevelFromPath("res://UI/MainMenu.tscn")
