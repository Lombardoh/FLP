extends NPC

var active_follow: bool = true

func _ready() -> void:
	progress_bar.max_value = health
	progress_bar.value = health
	add_target(get_tree().get_first_node_in_group("target"))

func _physics_process(_delta) -> void:
	move_and_slide()

func _on_detection_range_body_entered(body) -> void:
	add_target(body)

