extends Node2D

@export var prev_room : String
var first_enter = true

# Called when the room is entered
func enter(mainnode):
	if first_enter:
		first_enter = false

func exit(mainnode):
	pass
