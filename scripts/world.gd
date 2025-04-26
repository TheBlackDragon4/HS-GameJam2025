extends Node2D

var screenSize = Vector2()
var maxTime = 5000
var time = 0

#load all required scenes and spawn their instances on startup
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	screenSize = get_viewport_rect().size

func _process(delta: float) -> void:
	if Time.get_ticks_msec() < maxTime:
		Input.warp_mouse(screenSize/2)
	
