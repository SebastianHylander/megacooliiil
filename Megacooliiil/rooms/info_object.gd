extends Area2D

@export var message : String

# print clicked when clicked
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var textfield = get_node('../../../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield')
		textfield.write_text(message)
		
