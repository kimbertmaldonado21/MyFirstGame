extends StaticBody2D

var drop = null
func drop_item():
	if drop != null:
		var instance = drop
		instance.position = self.global_position
		get_node('/root/Game/Ysort_enemy').add_child(instance)
	else:
			drop = null
			return 0

func destroy():
	queue_free()
	drop_item()
	
		
func _on_Area2D_area_entered(area: Area2D) -> void:
	$AnimationPlayer.play("New Anim")
	MainWorld.Score_of_Player(10)
	

func _ready() -> void:
	$AnimationPlayer.play("spawn")
var time_out = 45


	
func _on_Timer_timeout() -> void:
	
	queue_free()
	drop_item()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("check"):
		queue_free()
		drop_item()

