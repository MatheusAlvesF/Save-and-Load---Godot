extends Control

signal mudar_vida
signal salvar


var acao : String = ""


func _on_adicionar_vida_pressed():
	acao = "+"
	emit_signal("mudar_vida", acao)

func _on_diminuir_vida_pressed():
	acao = "-"
	emit_signal("mudar_vida", acao)

func _on_salvar_pressed():
	emit_signal("salvar")

func _on_carregar_pressed():
	pass # Replace with function body.
