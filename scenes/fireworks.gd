extends Node3D

@export var player: Node3D
@export var camera: Camera3D

var rocket = preload("res://objects/Rocket.tscn") 

func _on_timer_timeout() -> void:
	var newRocket = rocket.instantiate()
	
	var newPos = player.global_position - camera.global_position
	
	newRocket.global_position = newPos * 4
	#newRocket.global_position.y += 2
	newRocket.initial_velocity = Vector3(0, randf_range(12.0, 25.0), 0)
	add_child(newRocket)
