extends State
class_name AttackState

@export var actor: CharacterBody2D
@export var animation_player: AnimationPlayer

func enter_state() -> void:
	actor.velocity = Vector2()
	animation_player.play("attack")
	actor.target.take_damage(actor.damage)

func exit_state() -> void:
	pass

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	if not actor.target:
		Transition.emit(self, "IdleState")
	else:
		Transition.emit(self, "AttackIntervalState")

	if actor.health < 1:
		Transition.emit(self, "DeathState")
