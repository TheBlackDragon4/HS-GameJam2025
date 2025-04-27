extends Node2D

@export var sprite_right: Texture2D
@export var sprite_down: Texture2D
@export var sprite_left: Texture2D
@export var sprite_up: Texture2D
@export var speed:float
@export var spawn_distance:float
@export var sprite:Sprite2D

var rotation_state = 0
@onready var light = preload("res://scenes/light.tscn")

	
func rotate_90():
	print("attempt to rotate ", name)
	rotation_state = posmod(rotation_state+1, 4)
	rotation_degrees = rotation_state * 90
	match rotation_state:
		0:
			sprite.texture = sprite_right
		1:
			sprite.texture = sprite_down
		2:
			sprite.texture = sprite_left
		3:
			sprite.texture = sprite_up
			
		

func fire(direction, sign, col) -> void:
	var light_instance = light.instantiate()
	light_instance.position = global_position + sign * Vector2(spawn_distance, 0)\
		.rotated(rotation_state*deg_to_rad(90)).rotated(direction)
	light_instance.apply_impulse(sign * Vector2(speed, 0)\
		.rotated(rotation_state*deg_to_rad(90)).rotated(direction))
	light_instance.light.color=Color(col)
	light_instance.dropped = true
	get_tree().get_root().call_deferred("add_child", light_instance)

func interact(direction, color):
	var dot = direction.dot(-1 * Vector2(1,0).rotated(rotation))
	var sign = sign(dot)
	print(dot)
	if abs(dot)>.9:
		if color.r:
			fire(deg_to_rad(60*sign), sign, Color(1, 0, 0))
		if color.g:
			fire(deg_to_rad(40*sign), sign, Color(0, 1, 0))
		if color.b:
			fire(deg_to_rad(20*sign), sign, Color(0, 0, 1))
