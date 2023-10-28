extends Area2D

@export var sprite_2d: Sprite2D
var description: String

func set_parameters(map_object):
	name = map_object.name
	description = map_object.description
	sprite_2d.texture = map_object.texture
