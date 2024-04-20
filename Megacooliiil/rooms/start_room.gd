extends Node2D

@export var prev_room : String

var first_enter = true

# Called when the room is entered
func enter(mainnode):
	if first_enter:
		first_enter = false
	mainnode.get_node("UILayer/BackArrow").visible = false

func exit(mainnode):
	mainnode.get_node("UILayer/BackArrow").visible = true
