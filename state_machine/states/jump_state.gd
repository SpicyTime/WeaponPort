extends State
@export var max_speed: float = 0.0
@export var friction: float = 0.0
@export var acceleration: float = 0.0

@export var jump_force: float = -500

func enter(_prev_state_name: String = "") -> void:
	super.enter()
	modify_node.velocity.y += jump_force


func can_enter(_prev_state_name: String = "") -> bool:
	return modify_node.is_on_floor() and (modify_node.jump or modify_node.velocity.y < 0)


func update(delta) -> void:
	_handle_fall(delta)
	_handle_horizontal_movement(max_speed, friction, acceleration, delta)
