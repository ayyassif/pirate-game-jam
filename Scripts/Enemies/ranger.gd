extends Enemy

@onready var forward_ray: RayCast3D = $ForwardRay
@onready var down_ray: RayCast3D = $DownRay
@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D
@onready var detection_area: Area3D = $DetectionArea

var isDrawing: bool = false
var target: CharacterBody3D

@export var speed:float = 2

func proccessWander():
	var forward_direction = transform.basis.x.normalized()
	velocity = forward_direction * speed
	move_and_slide()

func physicsProccessWander():
	if forward_ray.is_colliding() or not down_ray.is_colliding():
		animated_sprite_3d.flip_h = not animated_sprite_3d.flip_h
		rotate_y(PI)

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

func _on_detection_area_body_exited(body: Node3D) -> void:
	pass # Replace with function body.

func switch():
	if current_state == states.WANDER:
		animated_sprite_3d.play("Draw")
		current_state = states.ATTACK
	elif current_state == states.ATTACK:
		animated_sprite_3d.play("Wander")
		current_state = states.WANDER
		target = null
