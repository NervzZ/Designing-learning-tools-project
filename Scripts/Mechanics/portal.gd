extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.body_entered.connect(Callable(self, "_on_body_entered"))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

enum TeleportMode {COORDINATES, NEW_SCENE}

@export
var teleport_mode:TeleportMode = TeleportMode.COORDINATES

@export
var destination_coords = Vector2(0,0)

@export
var destination_scene:PackedScene

signal enter_portal



func new_target(mode:TeleportMode,target):
	teleport_mode=mode
	if mode ==TeleportMode.COORDINATES:
		destination_coords = target
	else:
		destination_scene = target


func teleportToCoordinates(body:Node2D):
	body.global_transform.origin = destination_coords

func teleportToNewScene(body:Node2D):
	if destination_scene:
		var id = destination_scene.instantiate()
		id.add_child(body)
		body.queue_free()

#not sure about the levelloader stuff,
#also, can i use the levelloader to
#move stuff from scene A to scene B?
func loadNewScene():
	LevelLoader.changeLevel(destination_scene)



func _on_body_entered(body:Node2D):
	if teleport_mode==TeleportMode.COORDINATES:
		teleportToCoordinates(body)
	else:
		if body.name == "Player":
			loadNewScene()
		else:
			teleportToNewScene(body)


