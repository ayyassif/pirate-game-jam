extends Node3D

@onready var ray_cast_3d: RayCast3D = $RayCast3D

@export var SPEED: float = 1.0

func _physics_process(delta: float) -> void:
	position += transform.basis * Vector3(0, 0, -SPEED)
	if ray_cast_3d.is_colliding():
		queue_free()
