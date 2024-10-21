class_name Game extends Node2D

var score = 0
@export var count = 0 #contagem de quantos tubaroes estao na cena
var maxCount = 5

func add_point():
	score += 1 #nao da pra usar score++
	update_score()
	
func update_score():
	$CanvasLayer/UI_Points.text = "Pontos: " + str(score)	
	
func spawn_object(obj, pos):
	if(count < maxCount):
		#cria uma instancia do tubarao quando acaba o tempo
		var spawnedObj = obj.instantiate()
		#definindo uma posicao aleatoria
		spawnedObj.position = pos
		add_child(spawnedObj)
		count += 1
