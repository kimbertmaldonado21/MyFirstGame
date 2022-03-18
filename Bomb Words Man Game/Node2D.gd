extends Node2D
class_name game

#onready var label = $YSort/TimerLabel

func _ready() -> void:
	MainWorld.highest_score()
	MainWorld.set_score()
	MainWorld.set_HIGHESTSCORE()






var boss_gen = 0 
static func save_score():
	var score = int(MainWorld.temp_score2)
	var highscore = int(MainWorld.temp_highscore)
#	if MainWorld.temp_score < MainWorld.temp_highscore:
	if score > highscore:
		write_score(MainWorld.temp_score)
		print("MainWorld.temp_score > MainWorld.temp_highscore:")
		if Actor.baseenemy > 3 :
			Actor.change_base_enemy()
		MainWorld.highest_score()
		MainWorld.set_HIGHESTSCORE()
	else:
		write_score(MainWorld.temp_highscore)
		print("MainWorld.temp_score < MainWorld.temp_highscore:")
		MainWorld.highest_score()
		MainWorld.set_HIGHESTSCORE()

	
	
	
	
	
static func load_score():
	var score = File.new()
	if not score.file_exists("res://save_game.txt"):
		return 0 
	score.open("res://save_game.txt",File.READ)
	var temp_highscore = score.get_line()
	score.close()
	return temp_highscore
	MainWorld.temp_highscore = temp_highscore


static func write_score(score):
	var save = File.new()
	print("saved")
	save.open("res://save_game.txt",File.WRITE)
	save.store_line(str(score)) #compare score with temp_highscore
	save.close()
	MainWorld.temp_highscore = score
		
func reset_score():

	MainWorld.temp_score = 0
	MainWorld.temp_score2 = 0
	MainWorld.Score = 0
	MainWorld.highscore = 0

func reload_cur_scene():
	reset_score()
	remove_child(get_node("Ysort_enemy"))
	get_tree().reload_current_scene()
	





