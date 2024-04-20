extends Area2D

@export var item : Resource
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var inventory = get_node('../../../UILayer/Inventory/Items')
		inventory.add_item(item.instantiate())
		get_node('../').queue_free()
