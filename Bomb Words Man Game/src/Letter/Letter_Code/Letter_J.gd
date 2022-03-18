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
	MainWorld.set_let("res://src/Letter/Letter_Scene/Letter_J.tscn")
	MainWorld.set_let_num("J")
	queue_free()
