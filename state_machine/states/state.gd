class_name State
extends Node

signal Transition

@export var actor: CharacterBody2D
@export var animation_player: AnimationPlayer

func enter_state() -> void:
	pass

func exit_state() -> void:
	pass

func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	pass

func emit_transition_signal(new_state_name: String):
	Transition.emit(self, new_state_name)
