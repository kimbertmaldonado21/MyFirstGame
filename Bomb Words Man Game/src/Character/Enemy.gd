extends Actor


var state = respawn
var path: Array = [] 	#contains position
var Game_Navigation: Navigation2D = null
var player:Player = null
onready var animationPlayer = $anim

var velocity: Vector2 = Vector2.ZERO
onready var tree = get_tree()

func _ready() -> void:
	
	yield(get_tree(),"idle_frame")
	var tree = get_tree()
	if tree.has_group("Game_Navigation"):
		Game_Navigation =  tree.get_nodes_in_group("Game_Navigation")[0]
	if tree.has_group("Player"):
		player = tree.get_nodes_in_group("Player")[0]
		
	
		
	

enum{
	respawn,
	CHASE,
	DIE
}

func idle():
	pass
func chase():
	Velocity = move_and_slide(Velocity)
func attack():
	pass
var speed = 150
func navigate():
	if path.size() >0:
		Velocity = global_position.direction_to(path[1]) * Actor.enemyspeed
		if global_position == path[0]:
			path.pop_front()


func generate_path():
	if Game_Navigation != null and player != null:
		path = Game_Navigation.get_simple_path(self.global_position,player.global_position,false)
	else:
		path = [null]
		
func respawn_anim():
	animationPlayer.play("idle_down")
	
	
func respawn_animEnd():
	state = CHASE
	
func _physics_process(delta: float) -> void:
	match state:
		respawn:
			respawn_anim()
		CHASE:
			if tree.has_group("Game_Navigation") and tree.has_group("Player"):
				generate_path()
				navigate()
				animationPlayer.play("run_down")
				chase()
	
		DIE:
			animationPlayer.play("Death")


func _on_Area2D_area_entered(area: Area2D) -> void:
	state = DIE
	MainWorld.Score_of_Player(20)



func _on_Hit_area_entered(area: Area2D) -> void:
	pass


func _on_Hit_body_entered(body: Node) -> void:
	path = []
