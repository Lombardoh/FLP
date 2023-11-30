extends State
class_name AttackIntervalState

func enter_state() -> void:
	actor.velocity = Vector2()
	actor.attack_timer.start(actor.attack_speed)

func exit_state() -> void:
	actor.attack_timer.stop()
	
func physics_update(_delta: float):
	if actor.targets.size() < 1:
		Transition.emit(self, "IdleState")
		return
	elif not actor.current_target or actor.position.distance_to(actor.current_target.position) > 25:
		actor.set_new_target()
		Transition.emit(self, "IdleState")
		return
			
	if actor.attack_timer.is_stopped():
		Transition.emit(self, "AttackState")
