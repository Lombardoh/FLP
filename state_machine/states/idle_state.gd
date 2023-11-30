extends State
class_name IdleState

var frame_check: int = 0

func enter_state() -> void:
	actor.velocity = Vector2()
	animation_player.play("idle")
	
func physics_update(_delta: float):
	if actor.targets.size() > 0:
		actor.set_new_target()

		if ray_cast and actor.current_target:
			var global_mouse_position = get_viewport().get_mouse_position()

			ray_cast.target_position = actor.current_target.position - actor.position

			if frame_check > 0 and not ray_cast.is_colliding():
				frame_check = 0
				Transition.emit(self, "FollowState")
			else:
				frame_check += 1

