extends State
class_name FollowState

@export var actor: CharacterBody2D
@export var animation_player: AnimationPlayer

func enter_state() -> void:
	var direction: Vector2 = (get_tree().get_first_node_in_group("target").position - actor.global_position).normalized()
	actor.velocity = direction * actor.speed
	animation_player.play("move")

func exit_state() -> void:
	pass

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	if not get_tree().get_first_node_in_group("target"):
		Transition.emit(self, "IdleState")

	
