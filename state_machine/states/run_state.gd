extends State
@export var max_speed: float = 0.0
@export var friction: float = 0.0
@export var acceleration: float = 0.0

func can_enter(_prev_state_name: String = "") -> bool:
	return modify_node.is_on_floor() and (modify_node.direction_vector.x != 0 or modify_node.velocity.x != 0)


func update(delta: float) -> void:
	_handle_horizontal_movement(max_speed, friction, acceleration, delta)
