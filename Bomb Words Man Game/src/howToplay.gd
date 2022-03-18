extends Node2D




func _ready() -> void:
	_hide()
	



func _hide():
	$Bomb.visible = false
	$movement.visible = false
	$Book.visible = false
	$box.visible = false


func _on_TouchScreenButton_pressed() -> void:
	_hide()
	$Bomb.visible = true	


func _on_Movement_icon_pressed() -> void:
	_hide()
	$movement.visible = true


func _on_Book_icon_pressed() -> void:
	_hide()
	$Book.visible = true


func _on_Box_icon_pressed() -> void:
	_hide()
	$box.visible = true


func _on_Box_icon2_pressed() -> void:
	_hide()	


func _on_Back_pressed() -> void:
	get_tree().change_scene('res://src/TitleScreen.tscn')
