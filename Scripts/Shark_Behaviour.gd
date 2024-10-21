class_name Shark extends Area2D

var FishingNetScene = preload("res://FishingNet.tscn")

func _input_event(viewport, event, shape_idx): #funcao padrao de input da godot
	#viewport eh onde ocorre o evento, evento eh a entrada e shape_idx verifica qual colisor esta sendo clicado
	if event is InputEventMouseButton and event.pressed: #evento padrao de deteccao da godot
		if event.button_index == MOUSE_BUTTON_LEFT: #verifica se foi o botao esquerdo
			var game:Game = $".." #vai par o nodo inicial
			#spawnar a rede
			game.spawn_object(FishingNetScene, self.position)
			game.add_point() #adiciona os pontos
			game.count -= 1
			#queue_free() #remove o tubarao da cena


func _on_timer_timeout():
	var tween = get_tree().create_tween().set_loops(3)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.2).from_current().set_trans(Tween.TRANS_ELASTIC)
