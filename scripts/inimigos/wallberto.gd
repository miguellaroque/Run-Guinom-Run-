extends Area2D

var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	position.x -= GlobalVar.vel_mundo * delta
	
	if position.x < (-screen_size.x - 50):
		queue_free()
