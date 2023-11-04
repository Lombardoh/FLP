extends State
class_name AttackState

func enter_state() -> void:
	actor.velocity = Vector2()
	animation_player.play("attack")
	if actor.current_target.has_method("take_damage"):
		actor.current_target.take_damage(actor.attack_damage)
		if actor.current_target.health <= 0:
			actor.set_new_target()
	
func physics_update(_delta: float):
	if actor.current_target and not animation_player.is_playing():
		Transition.emit(self, "AttackIntervalState")
		
	elif not animation_player.is_playing():
		Transition.emit(self, "IdleState")
		return
