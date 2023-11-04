extends NPC

var active_follow: bool = false

func _ready():
	progress_bar.max_value = health
	progress_bar.value = health

func _physics_process(_delta):
	move_and_slide()
	
func _on_detection_range_body_entered(body):
	set_new_target()

