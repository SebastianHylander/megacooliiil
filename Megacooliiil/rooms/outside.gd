extends Node2D

var state_queue = ["start", "crawling", "fading_in", "outside", "fading", "waking_up", "door_opening", "the_end", "thanks_for_playing"]
var next_state_delay = 0.0
var time_spent = 0.0
var closed_door = preload("res://images/start_room_closed.png")
var open_door = preload("res://images/start_room_open.png")
var main_node : Node
var text_time = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_spent += delta

	if time_spent > next_state_delay:
		match state_queue[0]:
			"start":
				get_node("../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield").write_text("You crawl through the hole that has appeard. As you crawl you suddenly notice the air changing. You breathe fresh air. After a few minutes you see the light at the end of the tunnel and...", text_time)
				next_state_delay = 13
			"crawling":
				get_node("../AudioStreamPlayer2D").playing = false
				get_node("Room/outside").playing = true
				next_state_delay = 10.0
				get_node("../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield").write_text("You exit the hole. You feel the sun shine on you face. You smell the grass and the flowers. You are free!", text_time)
			"fading_in":
				next_state_delay = 22.0
				get_node("../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield").write_text("But you still do not feel right... There are a lot of questions unanwsered... How did you end up in there? Who helped you on your way? And how did Bill end up down there as well? You don't really understand. But still, you are free, and that is the most important thing right now.", text_time)
			"outside":
				next_state_delay = 10.0
				get_node("../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield").write_text(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ", 0.5)
				fade(1)
				get_node("Room/outside").playing = false
			"fading":
				next_state_delay = 10.0
				get_node("../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield").write_text(" ")
				get_node('Room').set_texture(closed_door)
				get_node("../AudioStreamPlayer2D").playing = true
			"waking_up":
				next_state_delay = 8.0
				get_node('Room/squek').play()
				get_node('Room').set_texture(open_door)
			"door_opening":
				fade(1)
				get_node("../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield").write_text("The End...", .3)
				next_state_delay = 7.0
			"the_end":
				get_node("../UILayer/MarginContainer/Panel/MarginContainer/Panel/Textfield").write_text("Thanks for playing!", text_time)
				next_state_delay = 5.0
			"thanks_for_playing":
				get_tree().quit()
		time_spent = 0
		state_queue.pop_front()
	if len(state_queue) > 0:
		match state_queue[0]:
			"crawling":
				pass
			"fading_in":
				fade(delta*-.4)
			"outside":
				pass
			"fading":
				pass
			"waking_up":
				fade(delta*-.2)
			"door_opening":
				pass
	
func enter(mainnode : Node):
	main_node = mainnode

func exit(mainnode : Node):
	pass

func fade(dif):
	get_node('Room/Polygon2D').color.a += dif
	if get_node('Room/Polygon2D').color.a < 0:
		get_node('Room/Polygon2D').color.a = 0
	elif get_node('Room/Polygon2D').color.a > 1:
		get_node('Room/Polygon2D').color.a = 1
		
