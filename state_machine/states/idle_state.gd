extends State
class_name IdleState

func enter_state() -> void:
	actor.velocity = Vector2()
	animation_player.play("idle")
	
func physics_update(_delta: float):
	if actor.targets.size() > 0:
		actor.set_new_target()
		Transition.emit(self, "FollowState")
		
