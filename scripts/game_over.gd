extends Control

@onready var fade = $Fade
@onready var recorde = $LabelPontos

func _ready() -> void:
	recorde.text = "SEU RECORDE: " + str(int(GlobalVar.recorde))
	
func trocar_cena(cena: String) -> void:
	GlobalVar.morto = false
	fade.transicao = true
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/%s" % cena)

func _on_reiniciar_pressed():
	trocar_cena("main_game.tscn")

func _on_voltar_menu_pressed() -> void:
	trocar_cena("main_menu.tscn")
