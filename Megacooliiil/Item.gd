extends Panel

var holding : Node
var selected = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	# Assuming you have a Button child named "clickableArea"
	var clickableArea = $Button
	# Connect the pressed signal of the clickable area to a method
	clickableArea.connect("pressed", _on_panel_clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_item(item : Node):
	holding = item
	var sprite = item.get_child(0)
	sprite.scale.x = size.x/sprite.texture.get_width()
	sprite.scale.y = size.y/sprite.texture.get_height()
	add_child(item)

func remove_item():
	remove_child(holding)
	holding = null
	deselect()

func _on_panel_clicked():
	if selected:
		get_node('../').deselect_item()
		return
	# Handle the click event here
	if holding:
		get_node('../').select_item(self)

func select():
	selected = true
	get_node('./selected_frame').visible = true
	
func deselect():
	selected = false
	get_node('./selected_frame').visible = false
