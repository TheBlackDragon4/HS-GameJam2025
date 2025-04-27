extends Node2D

@onready var current_color : Color = Color.from_rgba8(0,0,0)
@onready var sprite : Sprite2D = $Sprite2D
@export var pointlight : PointLight2D

@export var max_colors = [
	0, #R
	255, #G
	255  #B
]

func _ready() -> void:
	sprite.self_modulate = current_color

func absorb(is_dropped=false, color : Color = Color(1,1,1)):
	#print("absorbing color!")
	#print(" eat that light dispenser.. ")
	addColor(color)

func _on_timer_timeout():
	#addColor(Color.from_rgba8(15, 30, 45))
	pass

func addColor(inputColor : Color):
	#print("adding color!")
	#if current_color.r8 == max_colors[0] and \
		#current_color.g8 == max_colors[1] and \
		#current_color.b8 == max_colors[2]:
			#current_color = Color.from_rgba8(0,0,0)

	inputColor /= 25

	if current_color.r8 < max_colors[0]:
		current_color.r8 += inputColor.r8
	else:
		current_color.r8 = max_colors[0]
		
	if current_color.g8 < max_colors[1]:
		current_color.g8 += inputColor.g8
	else:
		current_color.g8 = max_colors[1]
		
	if current_color.b8 < max_colors[2]:
		current_color.b8 += inputColor.b8
	else:
		current_color.b8 = max_colors[2]
	
	#print(pointlight)
	pointlight.color = current_color

	var factor = 255.0/max(current_color.r8, current_color.g8, current_color.b8)
	pointlight.color.r8 *= factor
	pointlight.color.g8 *= factor
	pointlight.color.b8 *= factor
	
	var val = max(current_color.r, current_color.g, current_color.b)
	pointlight.scale = Vector2(val, val)
	
	if current_color.r8 == max_colors[0] and \
		current_color.g8 == max_colors[1] and \
		current_color.b8 == max_colors[2]:
			$Label.text = "FULL!"
	else:
		$Label.text =  \
			str(current_color.r8) + "-" + str(current_color.g8) + "-" + str(current_color.b8)
		  #"r: " + str(current_color.r8) + \
		#"\ng: " + str(current_color.g8) + \
		#"\nb: " + str(current_color.b8)
		#"\npl-r: " + str(pointlight.color.r8) + \
		#"\npl-g: " + str(pointlight.color.g8) + \
		#"\npl-b: " + str(pointlight.color.b8) + \
		#"\nscale: " + str($RigidBody2D/PointLight2D.scale)
		
	sprite.self_modulate = current_color
