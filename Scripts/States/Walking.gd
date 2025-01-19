extends State
class_name Walking

@export var speed = 2.0
@export var acceleration = 20.0

func Enter():
	sprite.play("Walking")
	pass
	
func Exit():
	pass

func Update(_delta: float):
	if not Input.get_vector("MoveDown","MoveLeft","MoveRight","MoveUp"):
		Transitioned.emit(self, "Idle")
	pass

func _physics_Update(delta: float):
	player.velocity = Vector3.ZERO
	
	var raw_input: Vector2
	raw_input = Vector2(Input.get_axis("MoveLeft", "MoveRight"), Input.get_axis("MoveUp", "MoveDown"))
	print("-------------------------")
	print(raw_input)
	var direction := (player.transform.basis * Vector3(raw_input.x, 0, raw_input.y)).normalized()
	print(direction)
	print("-------------------------")
	if direction:
		player.velocity.x = direction.x * speed;
		player.velocity.z = direction.z * speed;
	#player.velocity = player.velocity.move_toward(direction * speed, acceleration)

	player.move_and_slide()
	
	pass
