extends Resource
class_name Inventory

signal items_changed(indexes)

@export var items: Array[Resource] = []

func set_item(item_index: int, item: Item) -> Item:
	var previous_item: Item = items[item_index] 
	items[item_index] = item
	emit_signal("items_changed", [item_index])
	return previous_item

func swap_items(item_index: int, target_item_index: int):
	var target_item: Item = items[target_item_index] 
	var item: Item = items[item_index]
	items[target_item_index] = item
	items[item_index] = target_item
	emit_signal("items_changed", [item_index, target_item_index])

func remove_item(item_index):
	pass
