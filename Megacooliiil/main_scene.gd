extends Node2D

var roomStart = preload("res://rooms/start_room.tscn").instantiate()
var roomJail = preload("res://rooms/jail_room.tscn").instantiate()
var roomPainting = preload("res://rooms/painting_room.tscn").instantiate()
var roomBreak = preload("res://rooms/break_room.tscn").instantiate()
var roomStorage = preload("res://rooms/storage_room.tscn").instantiate()
var roomEnd = preload("res://rooms/end_room.tscn").instantiate()

var rooms = {
	"roomStart": roomStart,
	"roomJail": roomJail,
	"roomPainting": roomPainting,
	"roomBreak": roomBreak,
	"roomStorage": roomStorage,
	"roomEnd": roomEnd
}

var currentRoom
var backEnabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(roomStart)
	var camera = get_child(0)
	currentRoom = roomStart
	currentRoom.enter(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_room(to_room):
	var newRoom = rooms[to_room]
	remove_child(currentRoom)
	
	#Making sure backarrow continues to be visible
	if backEnabled:
		currentRoom.exit(self)
	
	newRoom.enter(self)
	add_child(newRoom)
	currentRoom = newRoom

func get_room(roomname):
	return rooms[roomname]
