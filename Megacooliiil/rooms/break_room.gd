extends Node2D

@export var prev_room : String
var first_enter = true

# Called when the room is entered
func enter(mainnode):
	if first_enter:
		first_enter = false
		#unlock painting
		var painting_room = mainnode.get_room("roomPainting")
		painting_room.get_node("Room/Painting").locked = false
		
		#Change painting to fallen
		var fallen_painting = preload("res://images/painting_room_with_tunnel.png")
		painting_room.get_node("Room").set_texture(fallen_painting)
		
	mainnode.get_node("UILayer/BackArrow").visible = false

func exit(mainnode):
	mainnode.get_node("UILayer/BackArrow").visible = true
