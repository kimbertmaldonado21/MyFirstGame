extends Node2D



func _ready() -> void:
	$AnimationPlayer.play("New Anim")

func _on_TouchScreenButton_pressed() -> void:
	get_tree().change_scene('res://src/World/MainGame.tscn')


func _on_Skip_pressed() -> void:
	get_tree().change_scene('res://src/World/MainGame.tscn')
