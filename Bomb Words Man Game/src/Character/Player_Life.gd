extends Node2D

var life = preload('res://src/Character/Life.tscn')

onready var label = $Label2
func show_Life():
	var health = str(Actor.playerHealth)
	label.text = str(health)
		
	
		
func go():
	show_Life()




func _on_Timer_timeout() -> void:
	show_Life()
	$Timer.start()
