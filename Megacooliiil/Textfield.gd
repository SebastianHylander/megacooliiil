extends Label

var is_writing = false
var text_to_write = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_writing:
		# Add next character and trigger animation
		text += text_to_write[0]
		text_to_write = text_to_write.substr(1, len(text_to_write))

		# If all characters are written, stop
		if len(text_to_write) == 0:
			is_writing = false


func write_text(string):
	text_to_write = string
	text = ""
	is_writing = true
	

