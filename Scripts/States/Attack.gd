extends State
class_name Attack

func Enter():
	sprite.play(bomb.name + "Attack")
	bomb.explode()
	await get_tree().create_timer(1).timeout
	Transitioned.emit(self, "Idle")
	pass
