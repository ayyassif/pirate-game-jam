extends BaseBomb
class_name Bam

@onready var explosion: PackedScene = get_parent().bam_explosion

func explode():
	var instance = explosion.instantiate()
	instance.position = player.position
	add_child(instance)
