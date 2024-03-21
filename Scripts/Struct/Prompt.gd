# Prompt.gd
class_name Prompt

var text: String
var choices: Array = []

func _init(_text: String, _choices: Array):
	text = _text
	choices = _choices
