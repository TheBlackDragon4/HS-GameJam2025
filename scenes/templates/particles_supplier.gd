extends CPUParticles2D

@export var target: Node2D
@export var source: Node2D
@export var velocity: float
@export var range: float


func _on_ready() -> void:
	if source:
		self.global_position = source.global_position
	if target == null:
		target = find_target()
		#print(self.global_position, " ", target.global_position)
	if target != null:
		var vec = (target.global_position - self.global_position).normalized()
		self.direction = vec
		self.initial_velocity_max = velocity
		self.initial_velocity_min = velocity
		self.lifetime = self.global_position.distance_to(target.global_position) / velocity

func find_target() -> Node2D:
	var min_dist = INF
	var closest: Node2D = null
	for node : Sprite2D in get_tree().get_nodes_in_group("Particles"):
		var dist = self.global_position.distance_to(node.global_position)
		if dist < min_dist and \
			dist <= range and \
			get_parent().get_instance_id() != node.get_instance_id():
				min_dist = dist
				closest = node
	return closest
