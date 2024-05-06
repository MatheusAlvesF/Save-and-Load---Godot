extends Control

signal mudar_vida

var acao : String = ""


func _on_adicionar_vida_pressed():
	acao = "+"
	emit_signal("mudar_vida", acao)

func _on_diminuir_vida_pressed():
	acao = "-"
	emit_signal("mudar_vida", acao)
