extends Node
class_name State

signal Transitioned

@onready var sprite: AnimatedSprite3D = get_parent().sprite
@onready var bomb: BaseBomb
@onready var player: CharacterBody3D = get_parent().player

func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	pass

func _physics_Update(delta: float):
	pass

func detectAttack():
	if Input.is_action_just_pressed("LeftClick"):
		Transitioned.emit(self, "Attack")
