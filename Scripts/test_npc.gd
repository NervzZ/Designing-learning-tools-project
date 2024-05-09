extends CharacterBody2D

var keyboardsound = preload("res://Assets/Sounds/SFX/keyboard_and_mouse.mp3")
@onready var player = get_tree().get_nodes_in_group("Player")[0]
@onready var interaction_area: InteractionArea = $InteractionArea


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _physics_process(delta):

	var distance = global_position.distance_to(player.global_position)

	var maxDistance = 5000
	var volume = 1.0 - clamp(distance / maxDistance, 0.0, 1.0)


	# Time loop for footstep
	if $Timer.is_stopped(): 
		SoundManager.play_npc_sound(keyboardsound, 
										randf_range(0.8, 1.2), 
										50 * log(volume + 0.1) - 10)
		$Timer.start(3)
		
func _on_interact():
	DialogueLabDay01.discuss_entry_safety_optional()
