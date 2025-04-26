extends CharacterBody2D

var _movementspeed = 100
var _grid_size = 16

var sprite_position = Vector2()
var motion = Vector2()
var selected_tile = Vector2i(0,0)
var _map1 

var tab = 0
var index = 1

#scan tile at px position and interact with it
func _ready() -> void:
	_map1 = get_parent().get_parent().find_child("map1")

func _physics_process(delta: float) -> void:
	handle_movement()
	handle_inputs()
	
func handle_movement() -> void:
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	velocity = motion.normalized() * _movementspeed
	move_and_slide()
	
	if get_global_mouse_position() != Vector2(0, 0): # is there a mouse position?
		sprite_position = get_global_mouse_position()
	else:
		sprite_position = position
		
	selected_tile.x = floor(sprite_position.x/_grid_size)
	selected_tile.y = floor(sprite_position.y/_grid_size)
	
	sprite_position.x = selected_tile.x * _grid_size + _grid_size*.5
	sprite_position.y = selected_tile.y * _grid_size + _grid_size*.5
	
	$"../Sprite2D".position = sprite_position
func handle_inputs() -> void:
	if Input.is_action_just_pressed("destroy"):
		print("destroy")
		_map1.set_cell(selected_tile, 0, Vector2i(0, 0))
	if Input.is_action_just_pressed("build"):
		print("build")
		_map1.set_cell(selected_tile, 0, Vector2i(0, 0), 2)
	if Input.is_action_just_pressed("rotate"):
		print("rotate")
	if Input.is_action_just_pressed("tab left"):
		print("rotate")
	if Input.is_action_just_pressed("tab right"):
		print("rotate")
	if Input.is_action_just_pressed("menu left"):
		print("rotate")
	if Input.is_action_just_pressed("menu right"):
		print("rotate")

		
#build: place selected tile

#destroy: destroy selected tile underneath if there is something placed

#rotate: rotate a tiles sprite underneath
