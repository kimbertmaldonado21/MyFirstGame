extends Area2D




func _on_Area2D_area_entered(area: Area2D) -> void:
	if Actor.playerHealth == 0:
		pass
	else:
		Actor.health_decrease(1)
