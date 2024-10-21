extends Container

#carregar o tubarao
var TubaraoScene = preload("res://Shark.tscn")
func _on_timer_timeout():
	var pos = Vector2(randf_range(100,1000), randf_range(40,550))
	$"..".spawn_object(TubaraoScene, pos)
	
