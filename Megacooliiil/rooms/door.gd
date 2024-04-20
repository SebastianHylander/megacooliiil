extends Area2D

@export var next_room : String
@export var unlocked_message : String = "You walk through the door"
@export var locked_message : String = "The door is locked"
@export var key_name : String = "No key is needed"
@export var locked : bool

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var textfield = get_node('../../../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield')
		if not locked:
			textfield.write_text(unlocked_message)
			get_node('../../..').change_room(next_room)
		else:
			var inventory = get_node('../../../UILayer/Inventory/Items')
			var item = inventory.selected
			if item:
				if item.holding.get_meta('key_name') == key_name:
					locked = false
					textfield.write_text("You unlocked the door")
					inventory.remove_item(item)
				else:
					textfield.write_text("You can't use that item here")
			else:
				textfield.write_text(locked_message)
