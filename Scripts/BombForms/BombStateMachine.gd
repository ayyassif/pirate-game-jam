extends Node

@export var initial_bomb : BaseBomb
@export var player: CharacterBody3D
@export_category("All Explosions")
@export var bam_explosion : PackedScene
@export var bang_flash : PackedScene
@export var alberto_smoke : PackedScene

signal bombChanged

var current_bomb : BaseBomb
var bombs : Dictionary = {}

func _physics_process(delta: float) -> void:
	current_bomb.update(delta)

func _ready():
	print("hummmm")
	for child in get_children():
		if child is BaseBomb:
			bombs[child.name.to_lower()] = child;
			child.BombTransitioned.connect(on_child_transition)
	if initial_bomb:
		current_bomb = initial_bomb

func on_child_transition(bomb: BaseBomb, new_bomb_name: String):
	if bomb != current_bomb:
		return

	var new_bomb = bombs.get(new_bomb_name.to_lower())
	if !new_bomb:
		return
	
	current_bomb = new_bomb
	bombChanged.emit(current_bomb)
	
