extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$object.connect('droped_object', on_droped_object)

func on_droped_object(drag_object_groups, drop_platform_groups):
	# Aqui você trata a lógica de acordo com os grupos recebidos
	print("Objeto de drag solto!")
	print("Grupos do objeto de drag: ", drag_object_groups)
	var drop_platform_groups_copy = drop_platform_groups.duplicate()
	drop_platform_groups_copy.erase('dropable')
	print("Grupos da plataforma de drop: ", drop_platform_groups_copy)
	if(drop_platform_groups_copy == drag_object_groups):
		print("Os grupos são compatíveis!")
	else:
		print('Os grupos não são compatíveis')
