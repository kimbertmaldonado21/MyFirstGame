extends StaticBody2D

var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 3
func _ready() -> void:
	look_vec = player.position - global_position
	
func _physics_process(delta: float) -> void:
	move = Vector2.ZERO
	move = move.move_toward(look_vec, delta)
	move = move.normalized()*speed
	position += move


func _on_Area2D_area_entered(area: Area2D) -> void:
	if player != player:
	 queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	if player != player:
	 queue_free()
