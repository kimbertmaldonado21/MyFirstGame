extends Node2D



func _on_Timer_timeout() -> void:
	$Score.text = MainWorld.temp_score
	$Timer.start()
