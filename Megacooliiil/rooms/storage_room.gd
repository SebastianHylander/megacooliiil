extends Node2D

var first_enter = true

# Called when the room is entered
func enter(mainnode):
	if first_enter:
		first_enter = false
