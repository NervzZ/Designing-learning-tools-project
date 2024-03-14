extends Node

#Levels global variables
var firstLevel = preload("res://Levels/FirstLevel.tscn");

func changeLevel(level: PackedScene):
	get_tree().change_scene_to_packed(level)

