extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("New Anim")


func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if Actor.bomb_cap <=3:
		Actor.bomb_cap += 1
		queue_free()
	else:
		queue_free()
