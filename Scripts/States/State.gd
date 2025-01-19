extends Node
class_name State

signal Transitioned

@onready var sprite: AnimatedSprite3D = get_parent().sprite
@onready var player: CharacterBody3D = get_parent().player

func Enter():
	pass
	
func Exit():
	pass

func Update(_delta: float):
	pass

func _physics_Update(delta: float):
	pass
