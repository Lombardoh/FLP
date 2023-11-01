extends State
class_name IdleState

@export var actor: CharacterBody2D
@export var animation_player: AnimationPlayer

func enter_state() -> void:
	actor.velocity = Vector2()
	animation_player.play("idle")

func exit_state() -> void:
	pass

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	if is_instance_valid(actor.target):
		Transition.emit(self, "FollowState")
		
	if actor.health < 1:
		Transition.emit(self, "DeathState")
		
