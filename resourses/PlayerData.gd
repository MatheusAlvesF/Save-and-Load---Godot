extends Resource
class_name PlayerData

@export var vida : int = 100
@export var velocidade : int = 10000
@export var posicao : Vector2


func setVida(vidaPlayer : int):
	vida = vidaPlayer
	print(vida)

func setPosicao(posicaoPlayer : Vector2):
	posicao = posicaoPlayer
	print(posicao)
