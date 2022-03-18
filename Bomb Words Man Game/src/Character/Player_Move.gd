extends Actor
class_name Player

onready var animationPlayer = $anim
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var bomb = preload("res://src/Bomb/Bomb2.tscn")

enum{
	MOVE,
	Death,
	DESTROY_BOX,
	SET_BOMB
}

var state = MOVE
var speeda = 50.00
func Move(delta):
	Velocity = Vector2()
	Velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	Velocity.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	Velocity = Velocity.normalized()
	if Velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", Velocity)
		animationTree.set("parameters/Run/blend_position", Velocity)
		animationTree.set("parameters/Attack/blend_position", Velocity)
		animationState.travel("Run")
		Velocity = Velocity.move_toward(Velocity *(Actor.actorspeed), Actor.actorspeed * delta)
	else:
		animationState.travel("Idle")
		Velocity = Velocity.move_toward(Velocity *Basespeed,delta)
	if Input.is_action_just_pressed("destroy_box"):
		state = DESTROY_BOX
	if Input.is_action_just_pressed("set_bomb"):
		state = SET_BOMB
	if Actor.playerHealth <= 0:
		state = Death
	Velocity = move_and_collide(Velocity)

func destroy_box():
	animationState.travel("Attack")

func destroy_box_finished():
	state = MOVE
	
func bomba():
	if Actor.bomb_cap <= 0 :
		pass
	else:
		Actor.bomb_cap -= 1
		var current_bomb = bomb.instance()
		current_bomb.position = self.global_position
		get_node("/root").add_child(current_bomb)

func Set_bomb():
	animationState.travel("Set_Bomb")
	

func Set_bomb_Finished():
	state = MOVE
	
func _physics_process(delta: float) -> void:
	match state:
		MOVE:
			Move(delta)
		DESTROY_BOX:
			destroy_box()
		SET_BOMB:
			Set_bomb()
		Death:
			animationState.travel("death")
			
			
onready var death_paused = preload("res://src/Character/Death_node.tscn")
func pre():
	var death_pause = death_paused.instance()
	death_pause.position = get_viewport_rect().size / 2 
	get_node("/root/Game/Game_paused").add_child(death_pause)
func save_after_death():
	Node2d.save_score()
	Node2d.load_score()
	
	pre()


