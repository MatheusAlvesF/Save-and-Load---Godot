extends CharacterBody2D

signal atualizar_ui

var direction : Vector2 = Vector2.ZERO
var playerData : PlayerData = PlayerData.new()
var save_file_path : String = "c:/Users/Notebook/Desktop/GAME/Godot GDScript/Godot 4.2/SaveAndLoad/Saves/"
var save_file_name : String = "PlayerSave.tres"

func _process(delta):
	data()

func _physics_process(delta):
	movimentacao(delta)
	emit_signal("atualizar_ui", playerData.vida, self.position)
	
func movimentacao(delta) -> void:
	direction = Input.get_vector("esquerda", "direita", "cima", "baixo")
	
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * playerData.velocidade * delta
	elif direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	
	move_and_slide()

func tomar_dano():
	playerData.vida -= 5

func ganhar_vida():
	playerData.vida += 5

func _on_control_mudar_vida(acao):
	if acao == "+":
		ganhar_vida()
	elif acao == "-":
		tomar_dano()

func verificar_diretorio_salvar(caminho: String):
	DirAccess.make_dir_absolute(caminho)

func _on_control_salvar():
	verificar_diretorio_salvar(save_file_path)
	print("Salvando")
	var vida : int = playerData.vida
	playerData.setVida(vida)
	playerData.setPosicao(self.position)
	ResourceSaver.save(playerData, save_file_path + save_file_name)
	print("save")

func _on_carregar_pressed():
	playerData = ResourceLoader.load(save_file_path + save_file_name).duplicate(true)
	self.position = playerData.posicao
	
	print("load")
	
func data():
	if Input.is_action_just_pressed("debug"):
		print(playerData.vida)
		print(playerData.posicao)
