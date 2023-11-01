extends State
class_name AttackIntervalState

@export var actor: CharacterBody2D
@export var animation_player: AnimationPlayer

func enter_state() -> void:
	actor.velocity = Vector2()
	actor.attack_timer.start(2.0)

func exit_state() -> void:
	actor.attack_timer.stop()

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	if not actor.target:
		Transition.emit(self, "IdleState")
		return
	
	if actor.attack_timer.is_stopped():
		Transition.emit(self, "AttackState")
	
	if actor.health < 1:
		Transition.emit(self, "DeathState")
