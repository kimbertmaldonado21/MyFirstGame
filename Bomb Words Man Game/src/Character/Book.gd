extends Node2D


var game_state = null 
var displayValue = 0

onready var y = $Paused_Panel/Control/YSort/GridContainer.get_children()
func _on_Open_book_pressed() -> void:
#	if MainWorld.cd_count == 0:
#		pass
#	else:
#		MainWorld.set_cd_countminuss()
#		var gamestate = not get_tree().paused
#		get_tree().paused = gamestate
#		get_node("Paused_Panel/Control").visible = gamestate
#		get_node("Open_book").visible = false
#		game_state = gamestate
#		$Paused_Panel/Control/countdown.start()
#		$Open_book.set_block_signals(true)
#		$Open_book.self_modulate = 602525

	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
	get_node("Paused_Panel/Control").visible = gamestate
	get_node("Open_book").visible = false
	game_state = gamestate
	$Paused_Panel/Control/countdown.start()
	$Open_book.set_block_signals(true)
	$Open_book.self_modulate = 602525
		
		
#onready var contain = get_node("Paused_Panel/Control/YSort/Container")
onready var contain = get_node("Paused_Panel/Control/YSort/Container")
#/root/Game/YSort/Book/
#func removve_Childd():
#	remove_child(contain)


#var index = 0 
#func op():
#	for i in range(MainWorld.letters_instance.size()):
#		var pos = y[index] #pos#[index]
#		if pos.item == null:
#			y[index].item =  MainWorld.letters_instance[i]
#			y[index].drop_item()
#			index += 1
#		else:
#			op()
		
	
func game_resume():
	var gamestate = not get_tree().paused
	get_tree().paused = gamestate
	get_node("Paused_Panel/Control").visible = false
	get_node("Open_book").visible = true
	game_state = gamestate
	$CD_Timer.start()
#	index = 0

	
func _on_Close_Book_pressed() -> void:
	game_resume()
	$Paused_Panel/Control/countdown.stop()
	



func _on_Button_pressed() -> void:
	var text = $Paused_Panel/Control/Typing_area.text
	if $Paused_Panel/Control/Typing_area.text.to_lower() in MainWorld.words_stored:
		get_node("Paused_Panel/Control").visible = false
		$Paused_Panel/Wrong/Wrongword.visible = true
		$Paused_Panel/Wrong/Wrongword/Panel/wWord.text = text
		$Paused_Panel/Control/Typing_area.text = ""
		$Paused_Panel/Wrong/Wrongword/Panel/meaning.text = "Already Typed"
	else:
		check_word()
		$Paused_Panel/Control/countdown.stop()
	
onready var timer = get_node("Paused_Panel/Control/Panel/countdown")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("set_bomb"):
		print(MainWorld.words_stored)

func _on_countdown_timeout() -> void:
	game_resume()

	$Paused_Panel/Control/countdown.stop()
	
var text = File.new()


func  check_word():
	var index = 0 
	text.open("res:///words2.txt",File.READ)
	if not text.file_exists("res://words2.txt"):
		return 0 
#	var scored = $Paused_Panel/Control/Panel/Typing_area.get_text()
	var scored = $Paused_Panel/Control/Typing_area.get_text()
#	var temp_highscore = text.get_line()
	while !text.eof_reached():
		if scored.to_lower() == text.get_line().to_lower():
			MainWorld.Score_of_Player(scored.length())
			$Paused_Panel/Control/Typing_area.text = ""
			$Paused_Panel/Correct/Correctword/Panel/CWord.text = scored
			MainWorld.words_stored += [scored.to_lower()]
			$Paused_Panel/Correct/Correctword/Panel/Cmean.text = text.get_line()
			get_node("Paused_Panel/Correct/Correctword").visible = true
			$Paused_Panel/WordTimer.start()
			get_node("Paused_Panel/Control").visible = false
			$Paused_Panel/Wrong/Wrongword.visible = false
			return
		else:
			get_node("Paused_Panel/Control").visible = false
			$Paused_Panel/Wrong/Wrongword.visible = true
			$Paused_Panel/Wrong/Wrongword/Panel/wWord.text = scored
			$Paused_Panel/Control/Typing_area.text = ""
   

	text.close()

func time_correct():
	get_node("Paused_Panel/Correct/Correctword").visible = false
	game_resume()

	$Paused_Panel/Control/countdown.stop()
	$Paused_Panel/WordTimer.stop()
func _on_Timer_timeout() -> void:
	time_correct()




func _on_TouchScreenButton_pressed() -> void:
	time_correct()
func time_wrong():
	get_node("Paused_Panel/Wrong/Wrongword").visible = false
	game_resume()

	$Paused_Panel/Control/countdown.stop()
func _on_Wr_pressed() -> void:
	time_wrong()

var color = "ffffff"
func _on_CD_Timer_timeout() -> void:
	$Open_book.set_block_signals(false)
	$Open_book.self_modulate = color
	$CD_Timer.stop()
	$Paused_Panel/Control/countdown.stop()




#func _input(event):
#	if event is InputEventKey and event.pressed:
#		if event.scancode == KEY_T:
#			if event.shift:
#				print("Shift+T was pressed")
#			else:
#				print("T was pressed")

		
		
