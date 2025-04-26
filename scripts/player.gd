extends CharacterBody2D

var movementspeed = 100
var grid_size = 16

var selected_tile = Vector2()

#scan tile at px position and interact with it
func _physics_process(delta: float) -> void:
	var motion = Vector2()
	
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	motion = motion * delta * movementspeed
	move_and_collide(velocity)
	
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
	

#build: place selected tile

#destroy: destroy selected tile underneath if there is something placed

#rotate: rotate a tiles sprite underneath
