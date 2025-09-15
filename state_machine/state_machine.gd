extends Node
var current_state_name: String = ""
var prev_state_name: String = ""
var states: Dictionary[String, State] = {} # State name to state node
var states_priority: Array[String] = [] # Order of checking

func _ready() -> void:
	for state in get_children():
		if not state is State:
			push_error("Child of State Machine is not State") 
		states.set(state.name, state)


func set_state_priority(new_priority: Array[String]) -> void:
	states_priority = new_priority


func add_state(state_node: State, priority: int = 0):
	add_child(state_node)
	states.set(state_node.name, state_node)
	states_priority.insert(priority, state_node.name)


func enter_state(state_name: String):
	if current_state_name != "" and states.has("state_name"):
		states[current_state_name].exit()
		prev_state_name = current_state_name
	
	current_state_name = state_name
	states[state_name].enter()


func update(delta: float) -> void:
	for state_name in states_priority:
		var state: State = states[state_name]
		if state.can_enter():
			enter_state(state_name)
	
	states[current_state_name].update(delta)
