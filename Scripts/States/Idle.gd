extends State
class_name Idle

func Enter():
	sprite.play(bomb.name + "Idle")
	
func _physics_Update(_delta: float):
	if Vector2(Input.get_axis("MoveLeft", "MoveRight"), Input.get_axis("MoveUp", "MoveDown")):
		Transitioned.emit(self, "Walking")
	else:
		player.velocity.x = 0.0
		player.velocity.z = 0.0

func Exit():
	pass
