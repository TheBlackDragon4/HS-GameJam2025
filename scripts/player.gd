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
	
	selected_tile = position - position % grid_size
	
	
	

#build: place selected tile

#destroy: destroy selected tile underneath if there is something placed

#rotate: rotate a tiles sprite underneath
