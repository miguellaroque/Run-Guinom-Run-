extends Node2D

var pontos = 0

@onready var hud_pontos = $HUD/Pontos
@onready var transicao = $HUD/Transicao

func _process(delta: float) -> void:
	if GlobalVar.morto == false:
		pontos += delta * 5
	else:
		morreu()
	
	hud_pontos.text = "PONTOS: " + str(int(pontos))
	

func _physics_process(delta: float) -> void:
	if GlobalVar.vel_inimigo < GlobalVar.velMax_inimigo:
		GlobalVar.vel_inimigo += GlobalVar.accel_inimigo * delta
	
	if GlobalVar.vel_mundo < GlobalVar.velMax_mundo:
		GlobalVar.vel_mundo += GlobalVar.accel_mundo * delta

func morreu():
	if pontos > GlobalVar.recorde:
		GlobalVar.recorde = pontos
	
	transicao.play("fade_out")
	await get_tree().create_timer(0.9).timeout
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
