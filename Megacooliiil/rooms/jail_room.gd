extends Node2D

@export var prev_room : String
var first_enter = true
var play_sound = false
var sound_played = false

# Called when the room is entered
func enter(mainnode):
	if first_enter:
		first_enter = false
		
		#Dig hole in start era
		var start_hole = preload("res://images/start_hole.png")
		mainnode.get_room("roomStart").get_node("Room").set_texture(start_hole)
	
	elif not sound_played:
		play_sound = true
		sound_played = true
			
func _process(delta):
	if play_sound:
		get_node('Room/sound_player').play_sound()
		play_sound = false
	
func exit(mainnode):
	pass

