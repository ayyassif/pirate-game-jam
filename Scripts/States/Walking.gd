extends State
class_name Walking

@export var speed = 2.0
@export var acceleration = 20.0

func Enter():
	sprite.play(bomb.name + "Walking")
	
func Exit():
	pass

func _physics_Update(delta: float):
	var raw_input: Vector2
	raw_input = Vector2(Input.get_axis("MoveLeft", "MoveRight"), Input.get_axis("MoveUp", "MoveDown"))
	if not raw_input:
		Transitioned.emit(self, "Idle")
	var direction := (player.transform.basis * Vector3(raw_input.x, 0, raw_input.y)).normalized()
	if direction:
		player.velocity.x = direction.x * speed;
		player.velocity.z = direction.z * speed
	else:
		player.velocity.x = 0.0
		player.velocity.z = 0.0

	player.move_and_slide()
	
	pass
