extends Position2D

var drop = null
func drop_item():
	if drop != null:
		var instance = drop
		instance.position = self.global_position
		get_node('/root/Game/Ysort_enemy').add_child(instance)
		print("BOSS")
	else:
			drop = null
			print("no_boss")
			
func _ready() -> void:
	drop_item()
func _physics_process(delta: float) -> void:
	if MainWorld.value_time % 45 == 0:
		drop_item()
