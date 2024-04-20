extends Area2D

var label

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# print clicked when clicked
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var textfield = get_node('../../../../UILayer/MarginContainer/Panel/MarginContainer/Panel/HBoxContainer/Textfield')
		textfield.write_text("You recognize the face. It is you old friend Bill. He seems to be dead?")
		
