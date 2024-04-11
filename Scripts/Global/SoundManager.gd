extends Node

# Define audio players for different sound types
var music_player = AudioStreamPlayer.new()
var sfx_player = AudioStreamPlayer.new()
var ui_player = AudioStreamPlayer.new()
var ambient_player = AudioStreamPlayer.new()

func _ready():
	# Initialize players
	add_child(music_player)
	add_child(sfx_player)
	add_child(ui_player)
	add_child(ambient_player)

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
