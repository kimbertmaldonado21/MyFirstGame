extends Node2D

func _on_Bomb_pressed() -> void:
	Input.action_press("set_bomb")


func _on_Bomb_released() -> void:
	Input.action_release("set_bomb")


func _on_Pickaxe_pressed() -> void:
	Input.action_press("destroy_box")


func _on_Pickaxe_released() -> void:
	Input.action_release("destroy_box")
