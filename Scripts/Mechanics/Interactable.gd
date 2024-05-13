extends Node

class_name Interactable

@export var radius: float = 85

@onready var area = Area2D.new()
@onready var collision_shape = CollisionShape2D.new()
@onready var sprite: Sprite2D = find_child("Sprite2D", true, false)

var shader = preload("res://Shaders/highlight.gdshader")
var highlight: ShaderMaterial
var isPlayerIn = false

func _ready():
	_ready_additional()
	highlight = ShaderMaterial.new()
	highlight.set_shader(shader)
	
	area.name = "InteractionArea"
	add_child(area)
	area.position = Vector2.ZERO  # Center the area on the parent node
	
	var shape = CircleShape2D.new()
	shape.radius = radius
	collision_shape.set_shape(shape)
	area.add_child(collision_shape)
	area.collision_layer = 0xFFFFFFFF
	area.collision_mask = 0xFFFFFFFF
	area.connect("body_entered", _on_body_entered)
	area.connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		isPlayerIn = true
		if sprite:
			sprite.set_material(highlight)

func _on_body_exited(body):
	if body.is_in_group("Player"):
		print("exited")
		isPlayerIn = false
		if sprite:
			sprite.set_material(null)
			
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if sprite and isPlayerIn:
			if sprite.get_rect().has_point(sprite.to_local(event.position)):
				_trigger_action()

func _trigger_action():
	print("Interactable clicked")

func _ready_additional():
	pass
