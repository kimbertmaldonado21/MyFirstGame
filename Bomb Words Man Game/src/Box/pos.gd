extends Position2D

var drop = null

func drop_item():
	if drop != null:
		var instance = drop
		instance.position = self.global_position	
		get_node('/root/YSort/Box').add_child(instance)
	else:
		drop = null

func _ready() -> void:
#	$AnimationPlayer.play("drop")
	pass

func _physics_process(delta: float) -> void:
	$AnimationPlayer.play("drop")
	pass
