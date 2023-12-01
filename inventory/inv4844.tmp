extends GridContainer

var inventory = preload("res://Inventory/inventory.tres")

func _ready():
	inventory.connect("items_changed", _on_items_changed)
	update_inventory_display()

func update_inventory_display() -> void:
	for item_index in inventory.items.size():
		update_inventory_slot_display(item_index)

func update_inventory_slot_display(item_index: int) -> void:
	var inventory_slot_display = get_child(item_index)
	var item: Item = inventory.items[item_index]
	inventory_slot_display.display_item(item)
	
func _on_items_changed(indeses: Array[int]) -> void:
	for item_index in indeses:
		update_inventory_slot_display(item_index)
