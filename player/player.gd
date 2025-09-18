extends CharacterBody2D

const JUMP_FORCE: float = -200
var direction_vector: Vector2 = Vector2.ZERO
var jump: bool = false
var has_jumped: bool = false
@onready var state_machine: StateMachine = $StateMachine

func _ready() -> void:
	state_machine.set_state_priority(["Jump", "Run", "Idle", "Fall"])
	state_machine.enter_state("Idle")


func _physics_process(delta: float) -> void:
	_handle_movment_input()
	state_machine.update(delta)
	move_and_slide()
# Specifically movement
func _handle_movment_input() -> void:
	direction_vector.x = Input.get_axis("move_left", "move_right")
	jump = false
	if Input.is_action_pressed("jump"):
		jump = true
		has_jumped = true
