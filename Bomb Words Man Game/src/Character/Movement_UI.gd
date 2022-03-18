extends Node2D





func _on_right_pressed() -> void:
	Input.action_press("right")

func _on_up_pressed() -> void:
	Input.action_press("up")

func _on_down_pressed() -> void:
	Input.action_press("down")


func _on_left_pressed() -> void:
	Input.action_press("left")


func _on_up_released() -> void:
	Input.action_release("up")


func _on_left_released() -> void:
	Input.action_release("left")


func _on_right_released() -> void:
	Input.action_release("right")


func _on_down_released() -> void:
	Input.action_release("down")
