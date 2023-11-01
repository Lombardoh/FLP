class_name FiniteStateMachine
extends Node

@export var initial_state: State
@export var actor: CharacterBody2D
var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transition.connect(on_child_transition)
	
	if initial_state:
		initial_state.enter_state()
		current_state = initial_state

func _process(delta) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(state: State, new_state_name: String) -> void:
	if state != current_state: return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state: return
	
	if current_state:
		current_state.exit_state()
	
	new_state.enter_state()
	current_state = new_state


