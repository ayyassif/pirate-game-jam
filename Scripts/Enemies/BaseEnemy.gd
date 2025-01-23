extends Node3D
class_name Enemy

@export var health:float = 10

func takeDamage(damage: float):
	health -= damage
	if health <= 0:
		death()
	pass

func death():
	pass

func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	pass

func _physics_Update(delta: float):
	pass
