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
	
	var raw_input := Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	var direction := (player.transform.basis * Vector3(raw_input.x, 0, raw_input.y)).normalized()
	
	player.velocity = player.velocity.move_toward(direction * speed, acceleration)
	
	#
	#if direction:
		#player.velocity.x = direction.x * speed
		#player.velocity.z = direction.z * speed
	#else:
		#player.velocity.x = move_toward(player.velocity.x, 0, speed)
		#player.velocity.z = move_toward(player.velocity.z, 0, speed)
	player.move_and_slide()
	
	pass
