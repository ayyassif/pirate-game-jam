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

func proccessWander():
	if forward_ray.is_colliding() or not down_ray.is_colliding():
		rotate_y(PI)
	if current_direction == direction.LEFT:
		animated_sprite_3d.flip_h = true
	else:
		animated_sprite_3d.flip_h = false

func physicsProccessWander():
	var forward_direction = transform.basis.x.normalized()
	velocity = forward_direction * speed

	if int(forward_direction.z):
		current_direction = (
			direction.LEFT if (forward_direction.z > 0) == (camera.global_position.x >= global_position.x) else direction.RIGHT
		)
	elif int(forward_direction.x):
		current_direction = (
			direction.RIGHT if (forward_direction.x > 0) == (camera.global_position.z >= global_position.z) else direction.LEFT
		)
	
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
