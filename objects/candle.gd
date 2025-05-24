extends StaticBody3D
class_name Candle

@export var candle_height: float = 2
@export var candle_radius: float = 1
@export var green_or_red: bool = false

@export var green: StandardMaterial3D
@export var red: StandardMaterial3D

var random_number = RandomNumberGenerator.new()

@export var top = 1.0
@export var bottom = 1.0
@export var up = true
@export var speed = 0
var base_position: Vector3
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_sizes()
	start_moving()
	base_position = Vector3(position)
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

func start_moving():
	up = true if randf() < 0.5 else false
	speed = randf_range(0.1, 1.5)

func _process(delta):
	
	if up: 
		if position.y < base_position.y + top:
			position.y += delta*speed
		else:
			up = !up
	else:
		if position.y > base_position.y - bottom:
			position.y -= delta*speed
		else:
			up = !up
