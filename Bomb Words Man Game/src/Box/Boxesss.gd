extends Node2D


onready var boxx = load("res://src/Box/Box.tscn")
var random = RandomNumberGenerator.new()


func set_drop(boxes, item):
	random.randomize()
	var box_index = random.randi_range(0, boxes.size()-1)
	var box = boxes[box_index]

	if box.drop == null:
		boxes[box_index].drop = item
		print(item)
	else:
		set_drop(boxes, item)

	

func _ready() -> void:
	var boxes = get_node("Box_generator").get_children()
	for i in range(boxes.size()):
		set_drop(boxes,boxx.instance())
		
