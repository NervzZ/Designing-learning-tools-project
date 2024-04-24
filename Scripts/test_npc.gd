extends CharacterBody2D

var keyboardsound = preload("res://Assets/Sounds/SFX/keyboard_and_mouse.mp3")
@onready var player = get_tree().get_nodes_in_group("Player")[0]

	
func _physics_process(delta):

	var distance = global_position.distance_to(player.global_position)
	
	var maxDistance = 5000
	var volume = 1.0 - clamp(distance / maxDistance, 0.0, 1.0)
	
	print(50 * log(volume) - 20)
	# Time loop for footstep
	if $Timer.is_stopped(): 
		SoundManager.play_npc_sou	nd(keyboardsound, 
										randf_range(0.8, 1.2), 
										50 * log(volume + 0.1) - 10)
		print("trigred")
		$Timer.start(3)
