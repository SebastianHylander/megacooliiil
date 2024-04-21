extends Label

var is_writing = false
var text_to_write = ""
var time_spent = 0.0
var time_interval : float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_writing:
		time_spent += delta
		if time_spent > time_interval:
			# Add next character and trigger animation
			text += text_to_write[0]
			text_to_write = text_to_write.substr(1, len(text_to_write))
			time_spent = 0

		# If all characters are written, stop
		if len(text_to_write) == 0:
			is_writing = false


func write_text(string, time = .007):
	time_interval = time
	text_to_write = string
	text = ""
	is_writing = true
	

