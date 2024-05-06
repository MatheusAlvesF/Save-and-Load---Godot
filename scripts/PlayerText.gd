extends Control

@onready var posicao_atual : RichTextLabel = $PosicaoAtual
@onready var vida_atual : RichTextLabel = $VidaAtual

func _on_player_atualizar_ui(vida, posicaoPlayer):
	posicao_atual.text = "Posicao atual: " + str(posicaoPlayer)
	vida_atual.text = "Vida Atual: " + str(vida)
	
