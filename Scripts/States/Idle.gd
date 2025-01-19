extends State
class_name Idle

func Enter():
	sprite.play("Idle")
	
func Update(_delta: float):
	if Input.get_vector("MoveDown","MoveLeft","MoveRight","MoveUp"):
		Transitioned.emit(self, "Walking")

func Exit():
	pass
