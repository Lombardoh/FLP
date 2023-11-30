extends CharacterBody2D
class_name NPC

@export var health: int
@export var mov_speed: float
@export var attack_speed: float
@export var attack_damage: int
@export var targets: Array[Node2D]
@export var state_machine: FiniteStateMachine
@export var attack_timer: Timer
@onready var progress_bar: ProgressBar = $ProgressBar
@export var current_target: Node2D
var closest_target: Node2D = null

func add_target(new_target: Node2D) -> void:
	targets.append(new_target)
	set_new_target()

func set_new_target() -> void:
	if targets.size() > 0:
		current_target = get_closest_target()

func get_closest_target() -> Node2D:
	var closest_distance: float = 1000000
	
	for target in targets:
		if not is_instance_valid(target):
			continue
		var distance: float = position.distance_to(target.position)
		if distance < closest_distance:
			closest_distance = distance
			closest_target = target
	
	remove_freed_objects_from_targets()
	return closest_target

func take_damage(damage: int) -> void:
	health -= damage
	progress_bar.value = health
	
	if health < 1:
		state_machine.current_state.emit_transition_signal("DeathState")

func remove_freed_objects_from_targets() -> void:
	var filtered_targets: Array[Node2D] = []

	for target in targets:
		if is_instance_valid(target):
			filtered_targets.append(target)

	targets = filtered_targets 
