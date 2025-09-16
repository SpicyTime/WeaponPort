class_name State
extends Node
var modify_node: CharacterBody2D = null
var state_machine: StateMachine = null


func enter(_prev_state: String = "") -> void:
	print("Entering " + str(name))


func exit() -> void:
	pass


func can_enter(_prev_state: String = "") -> bool:
	return false


func update(_delta: float) -> void:
	return

func _handle_fall(delta: float) -> void:
	modify_node.velocity.y += ConstantManager.GRAVITY * delta


func _handle_horizontal_movement(max_speed: float, friction: float, acceleration: float, delta: float) -> void:
	if modify_node.direction_vector.x != 0:
		modify_node.velocity.x = move_toward(modify_node.velocity.x, max_speed * modify_node.direction_vector.x, acceleration * delta)
	else:
		modify_node.velocity.x = move_toward(modify_node.velocity.x, 0, friction * delta)
