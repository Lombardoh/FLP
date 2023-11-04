extends Control

@onready var basic_trap:PackedScene = preload("res://items/example_item/example_item.tscn")
@onready var basic_defender:PackedScene = preload("res://NPC/defenders/test_defender/test_defender.tscn")
@onready var basic_enemy:PackedScene = preload("res://NPC/enemies/test_enemy/test_enemy.tscn")

var spawn_on_hand = false
var spawn:PackedScene

func _on_trap_button_pressed():
	spawn = basic_trap
	spawn_on_hand = true

func _on_defender_button_pressed():
	spawn = basic_defender
	spawn_on_hand = true

func _on_enemy_button_pressed():
	spawn = basic_enemy
	spawn_on_hand = true

func _input(event:InputEvent) -> void:
	if Input.is_action_just_released("mouse_left_click"):
		if spawn_on_hand:
			var mouse_pos:Vector2 = get_global_mouse_position()
			var new_spawn = spawn.instantiate()
			get_parent().add_child(new_spawn)
			new_spawn.position = mouse_pos
			spawn_on_hand = false
