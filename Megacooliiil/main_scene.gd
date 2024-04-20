extends Node2D

var room1 = preload("res://rooms/first_room.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(room1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
