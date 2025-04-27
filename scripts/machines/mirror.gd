extends Node2D

@export var sprite_right: Texture2D
@export var sprite_down: Texture2D
@export var sprite_left: Texture2D
@export var sprite_up: Texture2D
@export var collision_box: CollisionShape2D

@export var speed:float
@export var spawn_distance:float
@export var sprite:Sprite2D

var rotation_state = 0
var cooldown = 1 #in s
@onready var light = preload("res://scenes/light.tscn")
var shots = 0

func rotate_90():
	print("attempt to rotate ", name)
	rotation_state = posmod(rotation_state+1, 4)
	match rotation_state:
		0:
			sprite.texture = sprite_right
		1:
			sprite.texture = sprite_down
		2:
			sprite.texture = sprite_left
		3:
			sprite.texture = sprite_up
	
