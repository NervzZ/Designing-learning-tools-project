# Prompt.gd
class_name Ending

var title: String
var text: String
var action: Callable

func _init(_title: String, _text: String, _action: Callable):
	title = _title
	text = _text
	action = _action
