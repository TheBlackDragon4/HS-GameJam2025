extends Node

@onready var light = preload("res://scenes/light.tscn")

func fire(c : Color, global_position : Vector2, rotation_state: float, spawn_distance:float) -> void: #TODO Farbe hinzufügen
	var light_instance = light.instantiate()
	light_instance.position = global_position + Vector2(spawn_distance, 0).rotated(rotation_state*deg_to_rad(90))
	light_instance.dropped = true
	light_instance.color = c
	print("light instance: ", light_instance.get_node("Sprite2D").modulate)
	get_tree().get_root().call_deferred("add_child", light_instance)
