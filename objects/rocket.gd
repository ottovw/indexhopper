extends RigidBody3D

@export var initial_velocity = Vector3(0,20,0)

func _ready() -> void:
	linear_velocity = initial_velocity

var explosion = preload("res://objects/Explosion.tscn")

func _process(delta):
	if linear_velocity.length() < 1:
		var effect = explosion.instantiate()
		effect.transform = transform
		get_parent().add_child(effect)
		queue_free()
		
