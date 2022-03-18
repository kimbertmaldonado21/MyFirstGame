extends Node2D



func _on_Area2D_body_entered(body: Node) -> void:
	MainWorld.set_cd_counplus()
	queue_free()

func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
