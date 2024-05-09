extends Node

#Levels global variables
var mainMenu = preload("res://UI/MainMenu.tscn")
var firstLevel = preload("res://Levels/FirstLevel.tscn");
var testLevel = preload("res://Levels/TestLevel.tscn");
var day_01_lab = preload("res://Levels/Day_01_lab.tscn")

func changeLevel(level: PackedScene):
	get_tree().change_scene_to_packed.call_deferred(level)

#Only use this in specific cases such as cyclic dependencies with PackedScene
func changeLevelFromPath(path):
	get_tree().change_scene_to_file.call_deferred(path)
