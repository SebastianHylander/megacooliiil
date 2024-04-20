extends HBoxContainer

var selected : Panel
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_item(item : Node):
	for panel in get_children():
		if not panel.holding:
			panel.add_item(item)
			break

func remove_item(item : Node):
	for panel in get_children():
		if panel == item:
			panel.remove_item()
			break
	
func select_item(item : Panel):
	if selected:
		selected.deselect()
	selected = item
	selected.select()

func deselect_item():
	selected.deselect()
	selected = null
