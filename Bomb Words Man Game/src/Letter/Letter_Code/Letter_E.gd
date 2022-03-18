extends Node2D



func _ready() -> void:
	$AnimationPlayer.play("New Anim")



func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	MainWorld.set_let("res://src/Letter/Letter_Scene/Letter_E.tscn")
	MainWorld.set_let_num("E")
	queue_free()
