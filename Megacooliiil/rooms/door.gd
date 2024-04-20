extends Area2D

@export var next_room : String
@export var unlocked_message : String = "You walk through the door"
@export var locked_message : String = "The door is locked"
@export var locked : bool

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var textfield = get_node('../../../UILayer/MarginContainer/Panel/MarginContainer/Panel/HBoxContainer/Textfield')
		if not locked:
			textfield.write_text(unlocked_message)
			get_node('../../..').change_room(next_room)
		else:
			textfield.write_text(locked_message)
