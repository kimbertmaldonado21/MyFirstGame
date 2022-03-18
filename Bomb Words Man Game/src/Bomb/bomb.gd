extends Node2D



func _process(delta: float) -> void:
	get_node("AnimationPlayer").play("bomb_explode")

func done():
	queue_free()
	Actor.bomb_cap += 1



