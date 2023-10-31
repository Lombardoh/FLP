extends CharacterBody2D

var health: int = 20
var speed: int = 30
var damage: int = 5

func _on_area_2d_body_entered(body):
	print("Damage taked: ", body.damage)
	health -= body.damage
	if health <= 0:
		queue_free()
	body.queue_free()

func _physics_process(delta):
	move_and_slide()
