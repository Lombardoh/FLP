extends State
class_name IdleState

@export var actor: CharacterBody2D

func enter_state() -> void:
	actor.velocity = Vector2()

func exit_state() -> void:
	pass

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	if get_tree().get_first_node_in_group("target"):
		Transition.emit(self, "FollowState")
