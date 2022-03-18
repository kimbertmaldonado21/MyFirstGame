extends Node2D

func pause():
	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
func _ready():
	$Label4.text = MainWorld.temp_score
	pause()




func _on_TouchScreenButton_pressed():
	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
	Actor.reset_player_health()
	remove_child(get_node("/root/Game/Game_paused"))
	get_node("/root/Node2d").reload_cur_scene()
	
