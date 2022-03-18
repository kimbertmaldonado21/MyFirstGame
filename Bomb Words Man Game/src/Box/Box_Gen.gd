extends Node2D

onready var ysort = $YSort.get_children()
var random = RandomNumberGenerator.new()

func set_drop(ysort, item):
	random.randomize()
	var pos_index = random.randi_range(0,ysort.size()-1) #index
	var pos = ysort[pos_index] #pos#[index]
	if pos.drop == null:
		ysort[pos_index].drop = item
	else:
		set_drop(ysort, item)

		

var enemy = 3

onready var Enemy = preload("res://src/Character/Enemy.tscn")
onready var cd = preload("res://src/Letter/Letter_Scene/Door_CD.tscn")
onready var bomb = preload("res://src/Asset_Box/Bomb.tscn")
onready var health = preload("res://src/Letter/Letter_Scene/Heart.tscn")
onready var boss = preload("res://src/Character/Boss.tscn")

func _ready() -> void:
	if Node2d.boss_gen==0:
		gen_with_boss()
	else:
		if Node2d.boss_gen%3 !=0:
			gen_without_boss()
		else:
			gen_with_boss()
	Node2d.boss_gen +=1
#		
		
		
		
func gen_without_boss():
	for i in range(Actor.enemy):
		set_drop(ysort, Enemy.instance())
	for i in range(1):
		set_drop(ysort,cd.instance())
	for i in range(1):
		set_drop(ysort,bomb.instance())
	for i in range(1):
		set_drop(ysort,health.instance())
		
func gen_with_boss():
	gen_without_boss()
	for i in range(1):
		set_drop(ysort,boss.instance())





