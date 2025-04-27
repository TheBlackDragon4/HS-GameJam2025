extends RigidBody2D

var life = 3
var lifespan = life
var dropped = false
@export var collision:CollisionShape2D
@export var light:PointLight2D
@export var sprite2D:Sprite2D

var color : Color = Color(1,1,1)
func _ready() -> void:
	sprite2D.modulate = color
	light.color = color
	if dropped:
		collision.disabled = true

func _physics_process(delta: float) -> void:
	life -= delta
	light.texture_scale = life/lifespan
	if life < 0:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Absorb"):
		print("am i dropped?  ", dropped)
		body.absorb(dropped, light.color)
		kill()
		#queue_free()
	
func kill():
	queue_free()
