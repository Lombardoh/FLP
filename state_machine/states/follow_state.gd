extends State
class_name FollowState

func enter_state() -> void:
	if not is_instance_valid(actor.current_target):
		Transition.emit(self, "IdleState")
		return
	var direction: Vector2 = (actor.current_target.position - actor.global_position).normalized()
	actor.velocity = direction * actor.mov_speed
	animation_player.play("move")
	
func physics_update(_delta: float):
	if not actor.current_target:
		Transition.emit(self, "IdleState")
		return

	if actor.current_target.position.distance_to(actor.position) < 25:
		Transition.emit(self, "AttackState")
		return
	elif actor.current_target.position.distance_to(actor.position) < 25:
		Transition.emit(self, "FollowState")
		
	var direction: Vector2 = (actor.current_target.position - actor.global_position).normalized()
	actor.velocity = direction * actor.mov_speed
