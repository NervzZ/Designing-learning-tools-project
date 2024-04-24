extends Node

# Define audio players for different sound types
var music_player = AudioStreamPlayer.new()
var sfx_player = AudioStreamPlayer.new()
var ui_player = AudioStreamPlayer.new()
var ambient_player = AudioStreamPlayer.new()

# Used for the sounds of the main character such as footstep
var character_sound_player = AudioStreamPlayer.new() 
var npc_sound_player = AudioStreamPlayer.new()

func _ready():
	# Initialize players
	add_child(music_player)
	add_child(sfx_player)
	add_child(ui_player)
	add_child(ambient_player)
	add_child(character_sound_player)
	add_child(npc_sound_player)
	
func play_music(stream: AudioStream):
	music_player.stream = stream
	music_player.play()

func play_sfx(stream: AudioStream):
	sfx_player.stream = stream
	sfx_player.play()
	
func play_ui(stream: AudioStream):
	ui_player.stream = stream
	ui_player.play()

func play_ambient(stream: AudioStream):
	ambient_player.stream = stream
	ambient_player.play()

func play_character_sound(stream: AudioStream, pitch: float, volume: float):
	character_sound_player.stream = stream
	character_sound_player.pitch_scale = pitch
	character_sound_player.volume_db = volume
	character_sound_player.play()

func play_npc_sound(stream: AudioStream, pitch: float, volume: float):
	npc_sound_player.stream = stream
	npc_sound_player.pitch_scale = pitch
	npc_sound_player.volume_db = volume
	npc_sound_player.play()
