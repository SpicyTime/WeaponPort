extends State
@export var max_speed: float = 0.0
@export var friction: float = 0.0
@export var acceleration: float = 0.0

func enter(_prev_state: String = "") -> void:
	super.enter()

func can_enter(_prev_state: String = "") -> bool:
	return not modify_node.is_on_floor() and modify_node.velocity.y >= 0


func update(delta: float) -> void:
	_handle_fall(delta)
	_handle_horizontal_movement(max_speed, friction, acceleration, delta)
