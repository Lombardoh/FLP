extends State
class_name DeathState

@export var actor: CharacterBody2D
@export var animation_player: AnimationPlayer

func enter_state() -> void:
	actor.velocity = Vector2()
	animation_player.play("death")

func exit_state() -> void:
	actor.queue_free()

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	if not animation_player.is_playing():
		exit_state()
		
