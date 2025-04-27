extends Node2D

@export var sprite_right: Texture2D
@export var sprite_down: Texture2D
@export var sprite_left: Texture2D
@export var sprite_up: Texture2D
@export var inside_right: Texture2D
@export var inside_down: Texture2D
@export var inside_left: Texture2D
@export var inside_up: Texture2D
@export var speed:float
@export var spawn_distance:float
@export var sprite:Sprite2D
@export var sprite_inside:Sprite2D
@export var _timer:Timer

var rotation_state = 0
var cooldown = 1.01 #in s
@onready var light = preload("res://scenes/light.tscn")
var charge = 0

func _ready() -> void:
	_timer.wait_time = cooldown


	
func rotate_90():
	print("attempt to rotate ", name)
	rotation_state = posmod(rotation_state+1, 4)
	match rotation_state:
		0:
			sprite.texture = sprite_right
			sprite_inside.texture = inside_right
		1:
			sprite.texture = sprite_down
			sprite_inside.texture = inside_down
		2:
			sprite.texture = sprite_left
			sprite_inside.texture = inside_left
		3:
			sprite.texture = sprite_up
			sprite_inside.texture = inside_up
			
		

func fire() -> void:
	var light_instance = light.instantiate()
	light_instance.position = global_position + Vector2(spawn_distance, 0).rotated(rotation_state*deg_to_rad(90))
	light_instance.dropped = true
	get_tree().get_root().call_deferred("add_child", light_instance)

func _on_timer_timeout() -> void:
	if charge > 0:
		charge -= 1
		fire()
		
func absorb(is_dropped):
	charge += 1
	print(" eat that light  collector..")
	print("charge = ", charge)
