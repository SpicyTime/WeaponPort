extends State
@export var jump_force: float = -250
func enter(_prev_state_name: String = "") -> void:
	modify_node.velocity.y += jump_force


func can_enter(_prev_state_name: String = "") -> bool:
	return modify_node.is_on_floor() and modify_node.jump


func update(delta) -> void:
	_handle_fall(delta)
