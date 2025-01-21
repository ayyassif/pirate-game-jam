extends Node
class_name BaseBomb

signal BombTransitioned

@onready var player: CharacterBody3D = get_parent().player

func update(delta: float) -> void:
	switchBomb()

func switchBomb() -> void:
	if Input.is_action_just_pressed("BamButton"):
		BombTransitioned.emit(self, "Bam")
	elif Input.is_action_just_pressed("BangButton"):
		BombTransitioned.emit(self, "Bang")
	elif Input.is_action_just_pressed("AlbertoButton"):
		BombTransitioned.emit(self, "Alberto")

func explode():
	pass
