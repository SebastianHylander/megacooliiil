extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var textfield = get_node('../../CanvasLayer/MarginContainer/Panel/MarginContainer/Panel/HBoxContainer/Textfield')
		textfield.write_text("It is a door!")
