extends Node2D


func _ready() -> void:
	$AnimationPlayer.play("New Anim")
	
func _on_Area2D_area_entered(area: Area2D) -> void:
	
	queue_free()
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("check"):
		print(MainWorld.h)


func _on_Area2D_body_entered(body: Node) -> void:
	MainWorld.set_let("res://src/Letter/Letter_Scene/Letter_H.tscn")
	MainWorld.set_let_num("H")
	queue_free()
