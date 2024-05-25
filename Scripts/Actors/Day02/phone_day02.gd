extends Interactable

@export var ringin = true
var ringing_sound = preload("res://Assets/Sounds/SFX/mixkit-old-telephone-ring-1357.wav")
var ringing_condition = "PhonedWithArmy"
@onready var player = get_tree().get_nodes_in_group("Player")[0]

func _trigger_action():
	SoundManager.stop_ambient()
	ringin = false
	DialogueDay02Home.discuss_entry_army_phonecall()

func _physics_process(delta):
	if ringin:
		var distance = global_position.distance_to(player.global_position)

		var maxDistance = 5000
		var volume = 1.0 - clamp(distance / maxDistance, 0.0, 1.0)
		# Time loop for ringing
		if $Timer.is_stopped(): 
			SoundManager.play_ambient(ringing_sound, 
										50 * log(volume + 0.1) - 10)
			$Timer.start(3)
