extends StaticBody3D
class_name Candle

@export var candle_height: float = 2
@export var candle_radius: float = 1
@export var green_or_red: bool = false

@export var green: StandardMaterial3D
@export var red: StandardMaterial3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_sizes()
	pass # Replace with function 

func set_sizes() -> void:
	var mesh = $candle.mesh.duplicate()
	var stickMesh = $stick.mesh.duplicate()
	var shape = $collisionShape.shape.duplicate()
	
	mesh.top_radius = candle_radius
	mesh.bottom_radius = candle_radius
	mesh.height = candle_height
	mesh.material = green if green_or_red else red
		
	stickMesh.height = candle_height + 2
	
	shape.radius = candle_radius
	shape.height = candle_height

	
	$candle.mesh = mesh
	$stick.mesh = stickMesh
	$collisionShape.shape = shape
	
