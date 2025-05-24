extends Node3D

func _ready() -> void:
	$CPUParticles3D.one_shot = true
	$CPUParticles3D2.one_shot = true
	


func _on_cpu_particles_3d_finished() -> void:
	queue_free()
