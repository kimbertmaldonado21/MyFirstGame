extends Panel

var item = null




func drop_item():
	if item != null:
		get_node("/root/Game/YSort/Book/Paused_Panel/Control/YSort/Container").add_child(item)
#		add_child(item)
	else:
		item = null

