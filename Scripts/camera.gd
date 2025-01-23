extends Node3D

# Sensitivity of the mouse movement
@export var player: CharacterBody3D
@export var camera: Camera3D
@export var spring_arm: SpringArm3D
@export var pivot: Node3D
@export var min_distance: float = 2
@export var max_distance: float = 5
@export var sensitivity: float = 0.5
var current_distance: float = (max_distance + min_distance) / 2

func _ready():
	camera.position.z = current_distance;
	spring_arm.spring_length = current_distance;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		player.rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		pivot.rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-90), deg_to_rad(45))
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP && current_distance >= min_distance:
			current_distance -= 0.1
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN && current_distance <= max_distance:
			current_distance += 0.1
		camera.position.z = current_distance;
		spring_arm.spring_length = current_distance;

func _process(delta):
	pass
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.is_action_just_pressed("LeftClick"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pivot.position.y = player.position.y - 1
