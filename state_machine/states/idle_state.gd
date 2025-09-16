extends State
func enter(_prev_state_name: String = "") -> void:
	super.enter()

func can_enter(_prev_state_name: String = "") -> bool:
	print(modify_node.is_on_floor())
	return modify_node.is_on_floor() and abs(modify_node.velocity.x) <= 3.0
	
