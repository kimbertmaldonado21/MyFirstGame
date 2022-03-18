extends Control

var hscore = 0


func _on_NewGameButton_pressed():
		get_tree().change_scene('res://src/World/Tutorial.tscn')


func _on_QuitButton_pressed() -> void:
	get_tree().quit()

func _ready() -> void:
	$HighScore.set_text(MainWorld.temp_highscore)

func _physics_process(delta: float) -> void:
	$HighScore.set_text(MainWorld.temp_highscore)



func _on_Timer_timeout() -> void:
#	$HighScore.set_text(MainWorld.temp_highscore)
	pass


func _on_HowToPlay_pressed() -> void:
		get_tree().change_scene('res://src/howToplay.tscn')
