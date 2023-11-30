extends State
class_name FollowState

func enter_state() -> void:
	if not is_instance_valid(actor.current_target):
		Transition.emit(self, "IdleState")
		return
		
	var direction: Vector2 = (nav_agent_2d.get_next_path_position() - actor.position).normalized()
	actor.velocity = direction * actor.mov_speed
	animation_player.play("move")
	
func physics_update(_delta: float):
	if not actor.current_target:
		Transition.emit(self, "IdleState")
		return

	nav_agent_2d.target_position = actor.current_target.position
	if actor.current_target.position.distance_to(actor.position) < 35:
		Transition.emit(self, "AttackState")
		return
	
	var direction: Vector2 = (nav_agent_2d.get_next_path_position() - actor.position).normalized()
	actor.velocity = direction * actor.mov_speed
