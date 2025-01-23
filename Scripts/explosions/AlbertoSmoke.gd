extends Node3D

@onready var world_environment: WorldEnvironment = $WorldEnvironment
@onready var area_3d: Area3D = $Area3D

@export var smoke_duration: float = 4
@export var fog_density: float = .5

func _ready() -> void:
	await get_tree().create_timer(smoke_duration).timeout
	queue_free()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		body.isInSmoke = true
		world_environment.environment.volumetric_fog_density = fog_density


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		body.isInSmoke = false
		world_environment.environment.volumetric_fog_density = 0
