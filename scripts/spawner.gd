extends Node2D



# Carregar inimigos
const BIGODYN = preload("uid://baw2ba4exdol8")
const WALLBERTO = preload("uid://y08myaeyaqq1")
const FOGUETINHO = preload("uid://c00cqj3i0gyhe")

# Carregar posição inicial
const CHAO_Y = 448.0
const WALLBERTO_Y = 416.0
const CEU_MIN_Y = 160.0
const CEU_MAX_Y = 320.0

# Variáveis iniciais
var screen_size

# Setup inicial
func _ready() -> void:
	screen_size = get_viewport_rect().size

func spawn_obj():
	# Escolher um numero entre 0 e 99
	var num_aleatorio =  randi() % 100
	var packed : PackedScene
	
	# Escolher inimigo para spawnar
	if num_aleatorio < 25:
		packed = FOGUETINHO
	elif num_aleatorio < 70:
		packed = BIGODYN
	else:
		packed = WALLBERTO
	
	# Definir inimigo a ser criado
	var instancia = packed.instantiate()
	instancia.position.x = screen_size.x + 120
	
	# Definir posição Y
	if packed == FOGUETINHO:
		instancia.position.y = randf_range(CEU_MIN_Y, CEU_MAX_Y)
	elif packed == WALLBERTO:
		instancia.position.y = WALLBERTO_Y
	else:
		instancia.position.y = CHAO_Y
		
	# Criar inimigo
	get_parent().add_child(instancia)

func _on_spawn_timer_timeout() -> void:
	spawn_obj()
