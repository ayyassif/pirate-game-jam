extends CharacterBody3D

@export_group("Camera")
@export_range(0.0, 1.0) var mouse_sensitivity: float = 0.25

var isInSmoke:bool = false
var camera_input_direction: Vector2 = Vector2.ZERO

@onready var camera_pivot: Node3D = $CameraPivot
@onready var camera_3d: Camera3D = $CameraPivot/SpringArm3D/Camera3D

func _unhandled_input(event: InputEvent) -> void:
	var is_camera_motion := (
		event is InputEventMouseMotion and
		Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED 
	)
	if is_camera_motion:
		camera_input_direction = event.screen_relative * mouse_sensitivity

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("LeftClick"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta: float) -> void:
	camera_pivot.rotation.x += -camera_input_direction.y * delta
	camera_pivot.rotation.x = clamp(camera_pivot.rotation.x, -1, 0.5)
	rotation.y -= camera_input_direction.x * delta
	camera_input_direction = Vector2.ZERO
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
