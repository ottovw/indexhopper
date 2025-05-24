extends Node3D

@export var move = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_hard_mode"):
		move = !move
		set_movement()

func _ready() -> void:
	set_movement()

func set_movement() -> void: 
	for child in get_children():
		if move:
			child.start_moving()
		else:
			child.speed = 0
