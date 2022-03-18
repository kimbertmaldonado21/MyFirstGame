extends Node2D


func _physics_process(delta: float) -> void:
	pass

	
var display  = 0
var i:int = 1
func set_time():
	display += 1
	var playerValueString = String(display)
	var playerValueParts = playerValueString.split(".")
	MainWorld.value_time = $Label.text
	$Label.set_text(playerValueParts[0])
	
	MainWorld.algo_dda_enemySpeed(Actor.Basespeed,MainWorld.value_time)
	MainWorld.set_score()


	
	
		
func _on_Timer_timeout() -> void:
	$Timer.wait_time = 1
	$Timer.start()
	set_time()







