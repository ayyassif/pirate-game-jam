extends BaseBomb
class_name Alberto

@onready var smoke: PackedScene = get_parent().alberto_smoke

func explode():
	var instance = smoke.instantiate()
	instance.position = player.position
	add_child(instance)
