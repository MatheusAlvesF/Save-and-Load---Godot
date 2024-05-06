extends CharacterBody2D

signal atualizar_ui

const speed = 100.0
var vida : int
var direction : Vector2 = Vector2.ZERO

func _physics_process(delta):
	movimentacao(delta)
	emit_signal("atualizar_ui", vida, self.position)
	
func movimentacao(delta) -> void:
	direction = Input.get_vector("esquerda", "direita", "cima", "baixo")
	
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed * delta
	elif direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	
	move_and_slide()


func tomar_dano():
	vida -= 5

func ganhar_vida():
	vida += 5

func _on_control_mudar_vida(acao):
	if acao == "+":
		ganhar_vida()
	elif acao == "-":
		tomar_dano()
