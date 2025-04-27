extends RigidBody2D

var life = 3
var lifespan = life
@export var light:PointLight2D

func _physics_process(delta: float) -> void:
	life -= delta
	light.texture_scale = life/lifespan
	if life < 0:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Absorb"):
		body.absorb()
		
		queue_free()
	pass # Replace with function body.
