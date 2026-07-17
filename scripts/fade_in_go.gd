extends TextureRect

var transicao = false

func _process(delta: float) -> void:
	var tween = create_tween()
	
	if !transicao:
		tween.tween_property(self, "modulate:a", 0.0, 1.0)
	else:
		tween.tween_property(self, "modulate:a", 1.0, 1.0)
