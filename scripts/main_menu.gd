extends Control

@onready var fade = $Fade
@onready var recorde = $LabelPontos

func _ready() -> void:
	$Iniciar.grab_focus()
	recorde.text = "SEU RECORDE: " + str(int(GlobalVar.recorde))

func _on_iniciar_pressed() -> void:
	GlobalVar.morto = false
	fade.transicao = true
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
