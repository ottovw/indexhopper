extends StaticBody3D


@export var candle_height: float = 2
@export var candle_radius: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$candle.mesh.top_radius = candle_radius
	$candle.mesh.bottom_radius = candle_radius
	$candle.mesh.height = candle_height
	$collisionShape.shape.radius = candle_radius
	$collisionShape.shape.height = candle_height
	$stick.mesh.height = candle_height + 2.0
	pass # Replace with function body.
