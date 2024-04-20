extends Area2D
@export var item : Resource
@export var message : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var hotbar = get_node('../../../UILayer/Inventory/Items')
		hotbar.add_item(item.instantiate())
		var textfield = get_node('../../../UILayer/MarginContainer/Panel/MarginContainer/Panel/HBoxContainer/Textfield')
		textfield.write_text(message)
		self.queue_free()
