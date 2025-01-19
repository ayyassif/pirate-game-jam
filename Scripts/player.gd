extends CharacterBody3D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _on_exploision_area_body_entered(body: Node3D) -> void:
	print(body.name)
