extends CharacterBody2D

var movementspeed = 100
var grid_size = 16
var controlled_by_mouse = true
var sprite_position = Vector2()

var motion = Vector2()
var selected_tile = Vector2i(0,0)

#scan tile at px position and interact with it
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	velocity = motion.normalized() * movementspeed
	move_and_slide()
	
	if get_global_mouse_position() != Vector2(0, 0): # is there a mouse position?
		sprite_position = get_global_mouse_position()
	else:
		sprite_position = position
		
	selected_tile.x = floor(sprite_position.x/grid_size)
	selected_tile.y = floor(sprite_position.y/grid_size)
	
	sprite_position.x = selected_tile.x * grid_size + grid_size*.5
	sprite_position.y = selected_tile.y * grid_size + grid_size*.5
	
	$"../Sprite2D".position = sprite_position
	# selected_tile = Vector2(position.x, position.y)# position - position % grid_size
	#
#func _ready():	
	#print(typeof(get_parent().get_node("map1")))
	#get_parent().get_node("map1").set_cell(Vector2(-2, -2), 1, Vector2(-2, -2))

var x = 0
var y = 0

func _process(delta):
	if Input.is_action_just_pressed("up"):
		print(get_parent().get_node("map1").get_cell_tile_data(Vector2(x, y)))
		y -= 1
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 0, Vector2(x, y))
		print(x, " ", y)
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 1, Vector2(x, y), 2)
	if Input.is_action_just_pressed("right"):
		print(get_parent().get_node("map1").get_cell_tile_data(Vector2(x, y)))
		x += 1
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 0, Vector2(x, y))
		print(x, " ", y)
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 1, Vector2(x, y), 2)
	if Input.is_action_just_pressed("down"):
		print(get_parent().get_node("map1").get_cell_tile_data(Vector2(x, y)))
		y += 1
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 0, Vector2(x, y))
		#ö
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 1, Vector2(x, y), 2)
		print(x, " ", y)
	if Input.is_action_just_pressed("left"):
		print(get_parent().get_node("map1").get_cell_tile_data(Vector2(x, y)))
		x -= 1
		#get_parent().get_node("map1").set_cell(Vector2i(x, y), 1, Vector2i(0, 0), 2)
		print(x, " ", y)
	
	#if Input.is_action_just_pressed("rotate"):
		#print("Rotate")
		##get_parent().get_node("map1").set_cell(Vector2(x, y), 0, Vector2(x, y), 1)
		#get_parent().get_node("map1").set_cell(Vector2i(x, y), 0, Vector2i(0, 0), 1)
	
	if Input.is_action_just_pressed("build"):
		print("Rotate")
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 0, Vector2(x, y), 1)
		get_parent().get_node("map1").set_cell(Vector2i(x, y), 0, Vector2i(0, 0), 2)
		#get_parent().get_node("map1").set_cell(Vector2(x, y), 1, Vector2(0, 0), 1)
		#get_parent().get_node("map1").place_scene
		#print(get_parent().get_node("map1").get_cell_source_id(Vector2(x, y)))
		
		
		# Move right.
	#var build_tile = local_to_map()
	#set_cel
	#print(get_parent().get_node("map1").get_cell_source_id(Vector2(-2, -2)))
	#get_cell_source_id
	#print(selected_tile)
	
	$Area2D.get_overlapping_bodies()
	
		
#build: place selected tile

#destroy: destroy selected tile underneath if there is something placed

#rotate: rotate a tiles sprite underneath
