extends CharacterBody2D

@onready var _map_buildings = get_parent().get_parent().find_child("builds")

@export var _movementspeed = 100

var _grid_size = 16

var sprite_position = Vector2()
var motion = Vector2()
var selected_tile = Vector2i(0,0)

var tab = 0
var tabCount = 1
var scenesIndex = 0
var scenesCount = 2

var orientation = 0 # 0 = left, 1 = right

#scan tile at px position and interact with it
func _ready() -> void:
	tabCount = _map_buildings["tile_set"].get_source_count()
	scenesCount = _map_buildings["tile_set"].get_source(0).get_alternative_tiles_count(Vector2i(0, 0)) 

func _physics_process(_delta: float) -> void:
	handle_movement()
	handle_inputs()
	
func handle_movement() -> void:
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if motion.x == 1.0 and orientation == 0:
		orientation = 1
		$AnimatedSprite2D.flip_h = true
	if motion.x == -1.0 and orientation == 1:
		orientation = 0
		$AnimatedSprite2D.flip_h = false
	
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
		_map_buildings.set_cell(selected_tile, 0, Vector2i(0, 0))
	if Input.is_action_just_pressed("build"):
		print("build")
		_map_buildings.set_cell(selected_tile, 0, Vector2i(0, 0), scenesIndex)
	if Input.is_action_just_pressed("rotate"):
		print("rotate")
		
	if Input.is_action_just_pressed("tab left"):
		tab = posmod((tab-1), tabCount)
		scenesCount = _map_buildings["tile_set"].get_source(tab).get_alternative_tiles_count(Vector2i(0, 0)) 
		scenesIndex = 1
	if Input.is_action_just_pressed("tab right"):
		tab = posmod((tab+1), tabCount)
		scenesCount = _map_buildings["tile_set"].get_source(tab).get_alternative_tiles_count(Vector2i(0, 0))  
		scenesIndex = 1
	if Input.is_action_just_pressed("menu left"):
		scenesIndex = posmod((scenesIndex-2), scenesCount)+1
	if Input.is_action_just_pressed("menu right"):
		scenesIndex = posmod((scenesIndex), scenesCount)+1

		
#build: place selected tile

#destroy: destroy selected tile underneath if there is something placed

#rotate: rotate a tiles sprite underneath
