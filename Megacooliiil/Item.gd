extends Panel

var holding : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_item(item : Node):
	holding = item
	var sprite = item.get_child(0)
	sprite.scale.x = size.x/sprite.texture.get_width()
	sprite.scale.y = size.y/sprite.texture.get_height()
	add_child(item)
