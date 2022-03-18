extends game

var node2 = load("res://Node2D.gd")
#var gams = load("res://src/World/MainGame.tscn")

func _on_PButton_pressed() -> void:
	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
	get_node("Paused_Panel/Control").visible = gamestate
	get_node("PButton").visible = false
	


func _on_Resume_pressed() -> void:
	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
	get_node("Paused_Panel/Control").visible = false
	get_node("PButton").visible = true
	





func _on_Quit_pressed() -> void:
	get_tree().quit()


func _on_retry_pressed() -> void:
	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
	get_node("Paused_Panel/Control").visible = gamestate
	get_node("PButton").visible = true

	Actor.reset_player_health()
	get_node("/root/Node2d").reload_cur_scene()
	
var main = load("res://src/TitleScreen.gd").new()

func _on_Main_pressed() -> void:
	get_node("/root/Game").queue_free()
	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
	get_node("Paused_Panel/Control").visible = gamestate
	get_node("PButton").visible = true
	get_tree().change_scene('res://src/TitleScreen.tscn')
	Node2d.load_score()
	Actor.reset_player_health()

