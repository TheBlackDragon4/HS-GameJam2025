extends RigidBody2D

var life = 3
var lifespan = life
var dropped = false
@export var collision:CollisionShape2D
@export var light:PointLight2D

func _ready() -> void:
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
		body.absorb(dropped)
		kill()
	if body.is_in_group("Interact"):
		body.interact(linear_velocity.normalized(), light.color)
		kill()
	if body.is_in_group("Block"):
		kill()
	
func kill():
	queue_free()
