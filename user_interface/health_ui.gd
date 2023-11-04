extends Control

@export var health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	$HPLabel.text = "HP = " + str(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
