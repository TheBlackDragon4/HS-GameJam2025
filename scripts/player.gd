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
	
	$Area2D.get_overlapping_bodies()
	
		
#build: place selected tile

#destroy: destroy selected tile underneath if there is something placed

#rotate: rotate a tiles sprite underneath
