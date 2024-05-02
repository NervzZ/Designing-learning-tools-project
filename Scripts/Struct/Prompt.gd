# Prompt.gd
class_name Prompt

var talker: Texture2D
var text: String
var choices: Array = []

func _init(_text: String, _choices: Array, _talker: Texture = PromptSprites.defaultTalker):
	talker = _talker
	text = _text
	choices = _choices
