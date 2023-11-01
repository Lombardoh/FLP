extends CharacterBody2D

var health: int = 20
var speed: int = 30
var damage: int = 7
var target: Node2D
@export var attack_timer: Timer
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready():
	progress_bar.max_value = health
	progress_bar.value = health

func _physics_process(delta):
	move_and_slide()
	
func _set_target(new_target: Node2D):
	target = new_target

func _on_detection_range_body_entered(body):
	_set_target(body)

func take_damage(damage: int):
	health -= damage
	progress_bar.value = health
