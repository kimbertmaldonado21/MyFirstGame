extends Timer


var displayValue = 0
onready var timer = Timer
func _ready():
	timer
	pass


func _on_Timer_timeout() -> void:
	displayValue += 1

func _physics_process(delta: float) -> void:

	pass
