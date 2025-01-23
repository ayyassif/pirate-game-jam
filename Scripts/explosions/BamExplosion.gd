extends Node3D

@onready var debris: GPUParticles3D = $Debris
@onready var fire: GPUParticles3D = $Fire
@onready var smoke: GPUParticles3D = $Smoke
@onready var area_of_explosion: Area3D = $AreaOfExplosion

@export var damage:float = 10

func _ready() -> void:
	debris.emitting = true
	fire.emitting = true
	smoke.emitting = true
	for body in area_of_explosion.get_overlapping_bodies():
		if body is Enemy:
			body.takeDamage(damage)
	await get_tree().create_timer(2.5).timeout
	queue_free()
