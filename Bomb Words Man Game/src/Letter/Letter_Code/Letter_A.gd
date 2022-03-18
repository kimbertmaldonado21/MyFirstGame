extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	$AnimationPlayer.play("New Anim")
	pass

func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
	print("delete")

func aadd():
#	MainWorld.set_let(load("res://src/Letter/Letter_Scene/Letter_B.tscn").instance())
	MainWorld.set_let("res://src/Letter/Letter_Scene/Letter_A.tscn")
	MainWorld.set_let_num("A")
	queue_free()
	
	
func _on_Area2D_body_entered(body: Node) -> void:
#	MainWorld.a += 1
	aadd()
	
func _physics_process(delta: float) -> void:
	pass
