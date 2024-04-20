extends Node2D

@export var prev_room : String
@export var whisper_streamer : AudioStreamPlayer2D
var first_enter = true
var rng = RandomNumberGenerator.new()

var delay : float = 5.0
var time_spent : float = 0

# Called when the room is entered
func enter(mainnode):
	if first_enter:
		first_enter = false

func _process(delta):
	time_spent += delta
	if time_spent > delay:
		play_sound()
		delay = rng.randf_range(8.0,18.0)
		time_spent = 0.0
	
func exit(mainnode):
	pass

func play_sound():
	whisper_streamer.stream = load("res://sounds/whispers/whisper "+str(rng.randi_range(1,9))+".wav")
	whisper_streamer.play()
