extends Label

@export var timer: Timer

var hours = 0
var minutes = 0
var seconds = 0

func _ready():
	timer.connect("timeout", _on_Timer_timeout)
	timer.start()

func _on_Timer_timeout():
	# Increment seconds
	seconds += 1
	if seconds >= 60:
		seconds = 0
		minutes += 1
	if minutes >= 60:
		minutes = 0
		hours += 1
	
	# Format the time as HH:MM:SS
	var time_str = "%02d:%02d:%02d" % [hours, minutes, seconds]
	# Update the label
	text = time_str


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		timer.stop()
		var font = label_settings.duplicate()
		font.font_color = Color.RED
		font.font_size = 96
		label_settings = font
		
