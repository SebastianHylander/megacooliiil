extends Label

var stop_writing = false
var is_writing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func write_text(string):
	while is_writing:
		stop_writing = true
	stop_writing = false	
	is_writing = true
	
	text = ""
	# Set the text to the string passed in one character at the time
	for i in range(string.length()):
		text += string[i]
		await get_tree().create_timer(.01).timeout 
		if stop_writing:
			break
	is_writing = false
