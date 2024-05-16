extends Node

#Levels global variables
var mainMenu = preload("res://UI/MainMenu.tscn")
var firstLevel = preload("res://Levels/FirstLevel.tscn");
var testLevel = preload("res://Levels/TestLevel.tscn");
var day_01_lab = preload("res://Levels/Day_01_lab.tscn")
var day_02_home = preload("res://Levels/Day_02_House.tscn")

func changeLevel(level: PackedScene):
	get_tree().change_scene_to_packed.call_deferred(level)
	var viewport : Viewport = get_viewport()
	viewport.canvas_transform.origin = Vector2(0, 0)

#Only use this in specific cases such as cyclic dependencies with PackedScene
func changeLevelFromPath(path):
	get_tree().change_scene_to_file.call_deferred(path)
	var viewport : Viewport = get_viewport()
	viewport.canvas_transform.origin = Vector2(0, 0)
