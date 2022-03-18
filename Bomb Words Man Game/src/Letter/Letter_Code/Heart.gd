extends Node2D

onready var heal = load('res://src/Character/Player_Life.gd').new()
func _ready() -> void:
	$AnimationPlayer.play("New Anim")
	

func _on_Area2D_body_entered(body: Node) -> void:
	print("bodyentered")
	if Actor.playerHealth < Actor.maxhealth:
		Actor.playerHealth +=1
		queue_free()


func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
	print("areaentered")
