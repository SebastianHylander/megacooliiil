extends Node2D

@export var prev_room : String
var first_enter = true
var mainnode : Node
var timer : float = 0.0
var triggered : bool = false

func _process(delta):
	if not triggered:
		timer += delta
		if timer > 5.0:
			unlock_painting()
			triggered = true

# Called when the room is entered
func enter(mainnode):
	if not triggered:
		timer = 0.0
		
	if first_enter:
		first_enter = false
	
	self.mainnode = mainnode
	mainnode.get_node("UILayer/BackArrow").visible = false

func exit(mainnode):
	mainnode.get_node("UILayer/BackArrow").visible = true

func unlock_painting():
	#unlock painting
	var painting_room = mainnode.get_room("roomPainting")
	painting_room.get_node("Room/Painting").locked = false
	painting_room.get_node("Room/FloorPainting").visible = true
	
	#Change painting to fallen
	var fallen_painting = preload("res://images/painting_room_with_tunnel.png")
	painting_room.get_node("Room").set_texture(fallen_painting)
	get_node('Room/painting_sound').play()
