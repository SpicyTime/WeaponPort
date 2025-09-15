extends CharacterBody2D
const MAX_SPEED: float = 500.0
const ACCELERATION: float = 750.0 
const FRICTION: float = 750.0
const AIR_FRICTION: float = FRICTION * 0.6
const GRAVITY: float = 490
const JUMP_FORCE: float = -200
var input_vector: Vector2 = Vector2.ZERO
var jump: bool = false

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	_handle_movment_input()


# Specifically movement
func _handle_movment_input() -> void:
	input_vector.x = Input.get_axis("move_left", "move_right")
	jump = true
