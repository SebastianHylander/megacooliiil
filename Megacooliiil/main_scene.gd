extends Node2D

var roomStart = preload("res://rooms/start_room.tscn").instantiate()
var roomJail = preload("res://rooms/jail_room.tscn").instantiate()

var rooms = {
	"roomStart": roomStart,
	"roomJail": roomJail
}

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(roomStart)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_room(from_room, to_room):
	remove_child(from_room)
	add_child(to_room)
