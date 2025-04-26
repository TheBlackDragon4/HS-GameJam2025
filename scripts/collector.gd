extends Node2D


var cooldown = 5000 #in ms
var time = Time.get_ticks_msec()

var light = preload("res://scenes/light.tscn")

func _ready() -> void:
	pass

func fire() -> void:
	var light_instance = light.instantiate()
	

func work() ->void:
	if (time - Time.get_ticks_msec()) > cooldown:
		pass
	else:
		fire()
		#emit a light :I
		
