extends CharacterBody3D
class_name Enemy

enum states{WANDER, ATTACK}

@export var health:float = 10
@export var initial_state: states = states.WANDER

var current_state: states
var isAlive: bool = true

func _ready() -> void:
	current_state = initial_state

func stateMachine(wander: Callable, attack: Callable):
	if not isAlive:
		return
	match current_state:
		states.WANDER:
			wander.call()
		states.ATTACK:
			attack.call()

func proccessWander():
	pass

func proccessAttack():
	pass
	
func physicsProccessWander():
	
	pass

func physicsProccessAttack():
	pass

func _process(delta: float) -> void:
	stateMachine(proccessWander, proccessAttack)

func _physics_process(delta: float) -> void:
	stateMachine(physicsProccessWander, physicsProccessAttack)

func takeDamage(damage: float):
	health -= damage
	if health <= 0:
		isAlive = false
		death()
	pass

func death():
	pass

func switch():
	pass
