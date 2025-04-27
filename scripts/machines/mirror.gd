extends Node2D

@export var sprite_right: Texture2D
@export var sprite_down: Texture2D
@export var sprite_left: Texture2D
@export var sprite_up: Texture2D
@export var node2D_rotate: Node2D

@export var sprite:Sprite2D

var rotation_state = 0
var cooldown = 1 #in s
@onready var light = preload("res://scenes/light.tscn")
var shots = 0

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
			
func absorb(dropped):
	print("S")
	
