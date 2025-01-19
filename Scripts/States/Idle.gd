extends State
class_name Idle

func Enter():
	sprite.play("Idle")
	
func Update(_delta: float):
	if Input.get_vector("MoveDown","MoveLeft","MoveRight","MoveUp"):
		print("hh");
		Transitioned.emit(self, "Walking")
	player.velocity.x = 0.0
	player.velocity.z = 0.0

func Exit():
	pass
