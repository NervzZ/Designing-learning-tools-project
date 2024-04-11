extends Node

#Levels global variables
var firstLevel = preload("res://Levels/FirstLevel.tscn");
var testLevel = preload("res://Levels/TestLevel.tscn");

func changeLevel(level: PackedScene):
	get_tree().change_scene_to_packed(level)

