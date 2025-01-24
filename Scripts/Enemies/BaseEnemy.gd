extends CharacterBody3D
class_name Enemy

enum states{WANDER, ATTACK}
enum direction{LEFT, RIGHT}

@export var health:float = 10
@export var initial_state: states = states.WANDER

@onready var camera:Camera3D = get_tree().get_first_node_in_group("Camera")

var current_state: states
var current_direction: direction = direction.LEFT
var isAlive: bool = true
var isDrawing: bool = false

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

func _process(delta: float) -> void:
	stateMachine(proccessWander, proccessAttack)

func _physics_process(delta: float) -> void:
	stateMachine(physicsProccessWander, physicsProccessAttack)

func proccessWander():
	pass

func physicsProccessWander():
	pass

func proccessAttack():
	pass

func physicsProccessAttack():
	pass


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
