extends Node

@export var initial_state : State
@export var sprite: AnimatedSprite3D
@export var player: CharacterBody3D

var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child;
			child.Transitioned.connect(on_child_transiton)
	
	if initial_state:
		current_state = initial_state
		initial_state.Enter()

func _process(delta: float) -> void:
	if current_state:
			current_state.Update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state._physics_Update(delta)

func on_child_transiton(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.Exit()
	
	current_state = new_state
	current_state.Enter()
	
