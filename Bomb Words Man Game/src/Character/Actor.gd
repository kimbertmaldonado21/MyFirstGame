extends KinematicBody2D

var maxhealth = 3
var bomb_cap = 1
var health = 1
var minusHealth = 0

var baseenemy = 4
var enemy = baseenemy
onready var playerHealth = health
var Basespeed = 50
var Velocity = Vector2()

var enemyspeed = Basespeed
var actorspeed = Basespeed
func health_decrease(healthMinus):
	minusHealth = healthMinus
	
func health_minus():
	playerHealth = playerHealth - minusHealth

func reset_player_health():
	playerHealth = health
	
func _physics_process(delta: float) -> void:
	health_minus()
	minusHealth = 0
	
func change_base_enemy():
	baseenemy -= 1
	
func _reset_character():
	playerHealth = health
	
