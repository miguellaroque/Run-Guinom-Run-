extends Control

@onready var fade = $Fade
@onready var recorde = $LabelPontos

func _ready() -> void:
	recorde.text = "SEU RECORDE: " + str(GlobalVar.recorde)

func _on_reiniciar_pressed():
	fade.transicao = true
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
