extends YSort



var random = RandomNumberGenerator.new()
onready var box_gen = load("res://src/Box/Box_Gen.tscn")

func gen_Box():
	var instance = box_gen.instance()
	instance.position = self.global_position

	get_node('/root/Game/YSort/YSort2').add_child(instance)
	
func _ready() -> void:
	gen_Box()
	




func _on_Timer_timeout() -> void:
	gen_Box()
	$Timer.start()
