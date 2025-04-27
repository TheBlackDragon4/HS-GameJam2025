extends CharacterBody2D


@export var root_hotbar: NinePatchRect
@export var _movementspeed = 100
@export var animated_sprite: AnimatedSprite2D
@export var area2d:Area2D

@onready var _map_buildings = get_parent().get_parent().find_child("builds")
@onready var hotbar = root_hotbar.get_child(0)

var _grid_size = 16

var sprite_position = Vector2()
var motion = Vector2()
var selected_tile = Vector2i(0,0)
var selected_menu = 0
var sprite_travel_distance = 30
var tab = 0
var tabCount = 1
var scenesIndex = 1
var scenesCount = 1

var orientation = 0 # 0 = left, 1 = right

var hotbarPos = 1

var currentSlot

#scan tile at px position and interact with it
func _ready() -> void:
	tabCount = _map_buildings["tile_set"].get_source_count()
	scenesCount = _map_buildings["tile_set"].get_source(0).get_alternative_tiles_count(Vector2i(0, 0)) 

func _physics_process(_delta: float) -> void:
	handle_movement(_delta)
	handle_inputs()
	
func handle_movement(_delta:float) -> void:
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if motion.x == 1.0 and orientation == 0:
		orientation = 1
		animated_sprite.flip_h = true
	if motion.x == -1.0 and orientation == 1:
		orientation = 0
		animated_sprite.flip_h = false
	
	var anim_spr_dist = (animated_sprite.position - position).length()
	if anim_spr_dist > sprite_travel_distance:
		var travel_speed = pow(anim_spr_dist - sprite_travel_distance, 1.1)
		travel_speed = 100-min(travel_speed, 99)
		animated_sprite.position = (travel_speed*animated_sprite.position + position) / (travel_speed+1)
	
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
		_map_buildings.set_cell(selected_tile, 0, Vector2i(-1, -1))
		
	if Input.is_action_just_pressed("build"):
		print("build:", tab, " ", scenesIndex)
		_map_buildings.set_cell(selected_tile, tab, Vector2i(0, 0), scenesIndex)
	
	if Input.is_action_just_pressed("rotate"):
		rotate_body()
		
	if Input.is_action_just_pressed("tab left"):
		tab = posmod((tab-1), tabCount)
		process_new_tab()
		
	if Input.is_action_just_pressed("tab right"):
		tab = posmod((tab+1), tabCount)
		process_new_tab()

	if Input.is_action_just_pressed("menu left"):
		scenesIndex = posmod(scenesIndex-2, scenesCount)+1
		process_new_menu()
		
	if Input.is_action_just_pressed("menu right"):
		scenesIndex = posmod(scenesIndex, scenesCount)+1
		process_new_menu()

	if Input.is_action_just_pressed("hud"):
		var temp =  root_hotbar
		print("z/OS")
		if temp.visible == true:
			temp.visible = false
		else:
			temp.visible = true
			temp.get_child(0).get_child(0).grab_focus()

func process_new_tab():
		scenesIndex = 1
		print("new tab: ", tab)
		scenesCount = \
			_map_buildings["tile_set"].get_source(tab).get_alternative_tiles_count(Vector2i(0, 0)) 
		root_hotbar.get_node("Label").text = \
			_map_buildings["tile_set"].get_source(tab).resource_name
			
		for slot in hotbar.get_children():
			slot.get_node("CenterContainer/ItemPicture").texture = \
				slot.get_meta("MenuToImage")[tab]
		hotbar.get_child(scenesIndex-1).grab_focus()
func process_new_menu():
	print("new menu index: ", scenesIndex)
	hotbar.get_child(scenesIndex-1).grab_focus()

func rotate_body():
	for i in area2d.get_overlapping_bodies():
		print("rotate?")
		if i.is_in_group("Machines"):
			print("rotate.")
			i.rotate_90()
	#$HotbarSlot.
		#get_viewport().gui_get_focus_owner().
		
#build: place selected tile

#destroy: destroy selected tile underneath if there is something placed

#rotate: rotate a tiles sprite underneath
