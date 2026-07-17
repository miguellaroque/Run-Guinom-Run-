extends CharacterBody2D

@onready var animacao = $AnimatedSprite2D
@onready var explosao = $"ExplosãoMorte"
@onready var colisao = $"ColisãoChão"

@export var gravidade = 1800
@export var forca_pulo = 800

var avanco_player = 256
var pulo_duplo = false
var morto = false

func _ready() -> void:
	explosao.visible = false
	explosao.play("default")

func _physics_process(delta: float) -> void:
	position.x = position.x + (avanco_player - position.x) * 0.035
	
	# Gravidade
	if not is_on_floor():
		velocity.y += gravidade * delta
	else:
		velocity.y = 0
		pulo_duplo = false
	
	# Pulo do Jogador
	if Input.is_action_just_pressed("pulo") and (is_on_floor() or !pulo_duplo):
		velocity.y = -forca_pulo
		
		if !is_on_floor():
			pulo_duplo = true
	
	# Mudar de posição
	if Input.is_action_pressed("avancar"):
		avanco_player = 420
	else:
		avanco_player = 256
	
	# Animação
	if is_on_floor() and !morto:
		animacao.play("corrida")
	if not is_on_floor() and pulo_duplo and !morto:
		animacao.play("pulo")
	if not is_on_floor() and !pulo_duplo and !morto:
		animacao.play("duplo_pulo")
	
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("inimigos"):
		morto = true
		GlobalVar.morto = true
		animacao.visible = false
		colisao.disabled = true
		explosao.play("explosao")
		explosao.visible = true
