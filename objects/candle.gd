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
	print("height="+str($candle.mesh.height)+" color="+str(green_or_red))
	pass # Replace with function body.

func set_sizes() -> void:
	$candle.mesh.top_radius = candle_radius
	$candle.mesh.bottom_radius = candle_radius
	$candle.mesh.height = candle_height
	$candle.mesh.material = green
	$collisionShape.shape.radius = candle_radius
	$collisionShape.shape.height = candle_height
	$stick.mesh.height = candle_height + 2.0
