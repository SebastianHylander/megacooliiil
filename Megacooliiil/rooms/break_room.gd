extends Node2D

var first_enter = true

# Called when the room is entered
func enter(mainnode):
	if first_enter:
		first_enter = false
		var painting = mainnode.get_room("roomPainting").get_node("Room/Painting")
		painting.locked = false
