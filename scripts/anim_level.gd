extends ParallaxBackground

func _physics_process(delta: float) -> void:
	scroll_offset.x -= GlobalVar.vel_mundo * delta
