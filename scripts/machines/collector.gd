extends Node2D

@export var sprite_right: Texture2D
@export var sprite_down: Texture2D
@export var sprite_left: Texture2D
@export var sprite_up: Texture2D
@export var inside_right: Texture2D
@export var inside_down: Texture2D
@export var inside_left: Texture2D
@export var inside_up: Texture2D
@export var speed:float
@export var spawn_distance:float
@export var sprite:Sprite2D
@export var sprite_inside:Sprite2D
@export var _timer:Timer

@export var pickup_range : float = 20

var near_resources = 0

var charges : Array = []

var rotation_state = 0
var cooldown = 1.01 #in s
@onready var light = preload("res://scenes/light.tscn")
#var charge = 0

func _ready() -> void:
	_timer.wait_time = cooldown
	
func rotate_90():
	print("attempt to rotate ", name)
	rotation_state = posmod(rotation_state+1, 4)
	match rotation_state:
		0:
			sprite.texture = sprite_right
			sprite_inside.texture = inside_right
		1:
			sprite.texture = sprite_down
			sprite_inside.texture = inside_down
		2:
			sprite.texture = sprite_left
			sprite_inside.texture = inside_left
		3:
			sprite.texture = sprite_up
			sprite_inside.texture = inside_up

func fire(c : Color) -> void: #TODO Farbe hinzufügen
	var light_instance = light.instantiate()
	light_instance.position = global_position + Vector2(spawn_distance, 0).rotated(rotation_state*deg_to_rad(90))
	light_instance.dropped = true
	light_instance.color = c
	print("light instance: ", light_instance.get_node("Sprite2D").modulate)
	get_tree().get_root().call_deferred("add_child", light_instance)
	#print(get_tree().get_root().get_children())r

func _on_timer_timeout() -> void:
	collect_nearby()
	#if near_resources > 0:
		#charge += 1
	if charges.size() > 0:
		for charge : Color in charges:
			print(str(charge))
		
		fire(charges.pop_front())
		
func absorb(is_dropped, color : Color):
	#pass #TODO absorbing colors
	charges.append(color)
	print(" eat that light  collector..")
	#print("charge = ", charge)

func collect_nearby():
	near_resources = 0
	var min_dist = INF
	var closest: Node2D = null
	for node in get_tree().get_nodes_in_group("Resource"):
		var dist = self.global_position.distance_to(node.global_position)
		if dist <= pickup_range:
			near_resources += 1
			charges.append(node.get_node("2D Object").modulate)
