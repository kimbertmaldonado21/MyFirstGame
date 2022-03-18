extends game

var temp_score = 0 #temp score of game 
var temp_score2 : int = 0 #overall
var highscore: int = 0
var Score: int = 0 

var temp_highscore = 0 #highscore from prev game
var value_time:int = 0
func _ready() -> void:
	temp_highscore = str(game.load_score())
	


var words_stored = []

func Score_of_Player(Score_player):
	Score = Score_player
	highest_score()
	
func highest_score():
	highscore += int(Score)
	set_score()
	set_HIGHESTSCORE()
	
func set_score():
	Score = 0
func set_HIGHESTSCORE():	
	temp_score = String(highscore)
	temp_score2 = highscore
	
#master func terminate_scene(scene):
#	self.queue_free()
	
	
func algo_dda_enemySpeed(BaseSpeed,Time):
	var TotalSpeed = 0
	var basespeed: int = BaseSpeed

	var time: int = Time
	TotalSpeed = basespeed + (((time+1)*(time/10))/90) #+ (((Score+1)*(Score/10))/40)#+(score) if want iadd yung scoccre
	Actor.enemyspeed = TotalSpeed



#var restart = false
#func re_start(value):
#	restart = value
#	re()

#func re():
#	if MainWorld.restart != false:
#		get_tree().reload_current_scene()
#		MainWorld.restart = false
	
##########################################################################################

#onready var letters_instance = []
#onready var letters = []
#
#
#func set_let(let): #letter_instance()
#	letters_instance += [load(let).instance()]
#
#func set_let_num(let):
#	letters += [let]
	
	
onready var cd_count = 0

func set_cd_counplus():
	cd_count +=1
func set_cd_countminuss():
	cd_count -=1
	
