extends Sprite2D

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		SimpleChangeScene.circle("res://node_2d1.tscn", 0.5)
