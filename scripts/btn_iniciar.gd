extends Button

@onready var anim = $AnimationPlayer

func _ready():
	focus_entered.connect(_on_focus_entered)
	focus_exited.connect(_on_focus_exited)

func _on_focus_entered():
	anim.play("btn_selecionado")

func _on_focus_exited():
	anim.stop()
	scale = Vector2.ONE
