extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initial_pos: Vector2
var drop_platform_original_color = Color(Color.MEDIUM_PURPLE, 0.7)
var drop_platform_new_color = Color(Color.REBECCA_PURPLE, 1)
signal droped_object(drag_object_groups, drop_platform_groups)

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initial_pos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			draggable = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				if has_same_groups(self.get_groups(), body_ref.get_groups()):
					tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				else:
					tween.tween_property(self, "global_position", initial_pos, 0.2).set_ease(Tween.EASE_OUT)
				droped_object.emit(self.get_groups(), body_ref.get_groups())

func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func has_same_groups(group_list_a, group_list_b):
	for group in group_list_a:
		if group in group_list_b:
			return true
	return false

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("dropable"):
		is_inside_dropable = true
		body.modulate = drop_platform_new_color
		body_ref = body

func _on_area_2d_body_exited(body: StaticBody2D):
	if body.is_in_group("dropable"):
		is_inside_dropable = false
		body.modulate = drop_platform_original_color
