extends Camera3D
var mouse = Vector2()

func _input(event):
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and event.just_pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_selection()

func get_selection():
	var worldspace = get_world_3d().direct_space_state
	var start = project_ray_origin(mouse)
	var end = project_position(mouse,1000)
	var query = PhysicsRayQueryParameters3D.create(start, end)
	query.collide_with_areas = true
	var result = worldspace.intersect_ray(query)
	#print(result)
	if result != null and result.collider.get_parent().get_parent().has_method("select"):
		result.collider.get_parent().get_parent().select()
