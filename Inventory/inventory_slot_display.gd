extends CenterContainer

@onready var texture_rect = $TextureRect

func display_item(item: Item) -> void:
	if item is Item:
		texture_rect.texture = item.texture

