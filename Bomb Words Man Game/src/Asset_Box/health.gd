extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("New Anim")




func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if Actor.playerHealth <=3:
		Actor.playerHealth  += 1
	else:
		queue_free()
		

