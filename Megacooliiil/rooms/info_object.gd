extends Area2D

@export var message : String
@export var cell_sound : bool

var uhhSound = preload("res://sounds/uhh.wav")
var sound_player := AudioStreamPlayer.new()


func _ready():
	add_child(sound_player)

# print clicked when clicked
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var textfield = get_node('../../../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield')
		textfield.write_text(message)
		if cell_sound:
			sound_player.stream = uhhSound
			sound_player.play()
