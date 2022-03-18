extends Actor
onready var spawn_fire = preload("res://src/Character/Enemy.tscn")
onready var bullets = preload("res://assets/Enemy/Boss_bullet.tscn")
enum{
	Spawn,
	Attack,
	Died,
	Idle
}


var state = Spawn
var boss_health = Actor.maxhealth
func _on_Hurt_Boxx_area_entered(area: Area2D) -> void:

	if boss_health !=0:
		boss_health -=1
	else:
		state = Died
	

func _physics_process(delta: float) -> void:
	match state:
		Spawn:
			spawn()
		Died:
			queue_free()
			MainWorld.Score_of_Player(50)
		Idle:
			$Timer.start()
	
			
			

func spawn():
	var enen = spawn_fire.instance()
	enen.position = self.position
	get_node('/root/Game/Ysort_enemy').add_child(enen)
	spawn_finished()
func spawn_finished():
	state = Attack
	$Timer.wait_time = 10
	$Timer.start()



var player = null

func _on_Detection_area_body_entered(body: Node) -> void:
	if body !=self:
		player = body

		$Timer_fIRE.start()
	pass
	

func _on_Detection_area_body_exited(body: Node) -> void:
	player = null
	pass


func _on_Timer_timeout() -> void:
	var state = Spawn
	
func Fire():
	var bullet = bullets.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer_fIRE.wait_time = 1.5
	

func _ready():
	$anim.play("respawn")



func _on_Timer_fIRE_timeout() -> void:
	if player != null:
		Fire()
