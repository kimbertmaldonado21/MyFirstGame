extends Node2D
onready var heal = load('res://src/Character/Player_Life.gd').new()
func _ready() -> void:
	$AnimationPlayer.play("New Anim")
	


func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
	print("areaentered")
	
func _process(delta: float) -> void:
	pass


func _on_Area2D_body_entered(body: Node) -> void:
#	if Actor.playerHealth <=3:
	print("bodyentered")
	if Actor.playerHealth < Actor.maxhealth:
		Actor.playerHealth +=1
		heal.show_Life()
		queue_free()
		
