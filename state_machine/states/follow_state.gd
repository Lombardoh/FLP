extends State
class_name FollowState

@export var actor: CharacterBody2D

func enter_state() -> void:
	actor.velocity = (get_tree().get_first_node_in_group("target").position - actor.global_position) * 5

func exit_state() -> void:
	pass

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	if not get_tree().get_first_node_in_group("target"):
		Transition.emit(self, "IdleState")

	
