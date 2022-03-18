extends Position2D

onready var boxx = load("res://src/Box/Box.tscn")
var random = RandomNumberGenerator.new()
onready var boxes = get_node("pb")


onready var current_bomb = boxx.instance()
	
func set_Box():
	current_bomb.position = self.global_position
	get_node("/root/Game/Box_generator").add_child(current_bomb)
	
	
func gen_box():
	var current_bomb = boxx.instance()
	current_bomb.position = self.global_position
	get_node("/root/Game/Box_generator").add_child(current_bomb)

var i = 1
var sec = 60

func _physics_process(delta: float) -> void:
	if i == 1:
		set_Box()
		i +=1
	if MainWorld.value_time == sec:
		gen_box()
		sec += 60

		
	


