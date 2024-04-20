extends Node2D

var roomStart = preload("res://rooms/start_room.tscn").instantiate()
var roomJail = preload("res://rooms/jail_room.tscn").instantiate()

var rooms = {
	"roomStart": roomStart,
	"roomJail": roomJail
}

var currentRoom

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(roomStart)
	currentRoom = roomStart
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_room(to_room):
	var newRoom = rooms[to_room]
	remove_child(currentRoom)
	add_child(newRoom)
	currentRoom = newRoom
