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

	for i in range(0,10):
		var green_or_red: bool = (i % 2 == 0)
		var new_node = candleTemplate.instantiate()
		new_node.name = "Candle #"+str(i)
		print("Added '"+new_node.name+"' to CandleChart.")
		new_node.position.x += 4*i
		new_node.position.z += (i % 2)*2
		new_node.candle_height = 2 + (1%2)*1
		new_node.candle_radius = 1
		new_node.green_or_red = green_or_red
		candle_chart.add_child(new_node)
		new_node.owner = candle_chart.owner  # Important: ensures the node is saved in the scene
		
