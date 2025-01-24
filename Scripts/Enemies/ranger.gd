extends Enemy

@onready var forward_ray: RayCast3D = $ForwardRay
@onready var down_ray: RayCast3D = $DownRay
@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D
@onready var detection_area: Area3D = $DetectionArea

var isDrawing: bool = false
var target: CharacterBody3D

@export var speed:float = 2

func _ready() -> void:
	animated_sprite_3d.play("Wander")
	var vector_a = Vector3(1, 0, 0)  # Vector A pointing along the x-axis
	var vector_b = Vector3(0, 1, 0)  # Vector B pointing along the y-axis
	
	var result = is_vector_b_to_the_right_or_left(vector_a, vector_b)
	print("Vector B is to the:", result)

func is_vector_b_to_the_right_or_left(vector_a: Vector3, vector_b: Vector3) -> String:
	# Calculate the cross product of A and B
	var cross_product = vector_a.cross(vector_b)
	
	# Use the global "up" direction (positive z-axis) as the reference
	var up_direction = Vector3(0, 0, 1)
	
	# Calculate the dot product of the cross product with the up direction
	var dot_product = cross_product.dot(up_direction)
	
	# Determine orientation based on the sign of the dot product
	if dot_product > 0:
		return "Right"
	elif dot_product < 0:
		return "Left"
	else:
		return "Aligned"  # This happens if they are in the same plane



func proccessWander():
	if forward_ray.is_colliding() or not down_ray.is_colliding():
		rotate_y(PI)
	if 1 == direction.LEFT:
		animated_sprite_3d.flip_h = true
	else:
		animated_sprite_3d.flip_h = false

func physicsProccessWander():
	var forward_direction = transform.basis.x.normalized()
	velocity = forward_direction * speed
	move_and_slide()
	

func proccessAttack():
	if target.isInSmoke:
		switch()

func physicsProccessAttack():
	pass

func _on_detection_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" and body.isInSmoke == false:
		isDrawing = true
		target = body
		if current_state == states.WANDER:
			switch()

func switch():
	if current_state == states.WANDER:
		animated_sprite_3d.play("Draw")
		current_state = states.ATTACK
	elif current_state == states.ATTACK:
		animated_sprite_3d.play("Wander")
		current_state = states.WANDER
		target = null
