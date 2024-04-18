extends Node2D

################################################################################
#                              !!! CAREFUL !!!
# If you need circular teleportation between scenes, at least one way of the 
# teleportation needs to be set via the destination_scene_path, instead of 
# cirectly using a packedscene (i.e. leave packed scene empty and supply a 
# string (like res://Levels/some_level.tscn) to destination_scene_path
################################################################################

enum TeleportMode {COORDINATES, NEW_SCENE}

@export
var teleport_mode:TeleportMode = TeleportMode.COORDINATES

@export
var destination_coords = Vector2(0,0)

@export
var destination_scene:PackedScene

@export #use this only if using cyclic teleportation!
var destination_scene_path:String

################################################################################

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.body_entered.connect(Callable(self, "_on_body_entered"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


# if you want to change behaviour of the portal at runtime
func new_target(mode:TeleportMode,target):
	teleport_mode=mode
	if mode ==TeleportMode.COORDINATES:
		destination_coords = target
	else:
		destination_scene = target

#local teleportation
func teleportToCoordinates(body:Node2D):
	body.global_transform.origin = destination_coords

#this is insanely hard, we'll have to think about this if/when we need it
func teleportToNewScene(body:Node2D):
	if destination_scene:
		print("well, wouldn't it be great if this were implementead ahahhahah sorry")

#"Teleport" to new scene, i.e. loads new scene when player teleports.
# In case of circular teleportation (being able to teleport back and forth, at least one of the
# scenes needs to be specified as a scene path (string, like res://Levels/some_level.tscn)
func loadNewScene():
	if destination_scene:
		LevelLoader.changeLevel(destination_scene)
	else:
		LevelLoader.changeLevelFromPath(destination_scene_path)

func _on_body_entered(body:Node2D):
	if teleport_mode==TeleportMode.COORDINATES:
		teleportToCoordinates(body)
	else:
		if body.name == "Player":
			loadNewScene()
		else:
			teleportToNewScene(body)


