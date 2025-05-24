@tool extends EditorScript


func _run() -> void: 
	var current_scene = get_scene() #get_editor_interface().get_edit_state().get_scene_root()
	if not current_scene:
		print("No scene is currently open.")
		return

	var candle_chart = current_scene.find_child("CandleChart")
	if not candle_chart:
		print("Node 'CandleChart' not found in the current scene.")
		return
		
	for child in candle_chart.get_children():
		candle_chart.remove_child(child)

	var candleTemplate = preload("res://objects/candle.tscn")
	
	
	var last_position = Vector3()
	var up = 1
	for i in range(0,35):
		
		var new_node = candleTemplate.instantiate()
		new_node.name = "Candle #"+str(i)
		print("Added '"+new_node.name+"' to CandleChart.")
		
		up = up if randf() > 0.3 else (up * -1)
		var green_or_red: bool = up > 0
		
		new_node.position = Vector3(last_position)
		new_node.position.x += randf_range(2.5, 5)
		new_node.position.z += randf_range(-2,2)
		new_node.position.y += randf_range(0,1.5)*up
		
		last_position = new_node.position
		
		new_node.candle_height = randf_range(1, 2)
		new_node.candle_radius = randf_range(0.8, 1.5)
		new_node.green_or_red = green_or_red
		candle_chart.add_child(new_node)
		new_node.owner = candle_chart.owner  # Important: ensures the node is saved in the scene
		
