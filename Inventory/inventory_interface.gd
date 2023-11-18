extends Control

var grabbed_slot_data: SlotData
var current_index: int = 0


@onready var npcs_inventory: PanelContainer = $npcs_inventory
@onready var grabbed_slot = $GrabbedSlot
@onready var npc_list: InventoryData = preload("res://NPC/NPCs_list.tres")

func _ready() -> void:
	set_inventory_data(npcs_inventory.inv_data)

func _physics_process(_delta) -> void:
	if grabbed_slot_data:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5, 5)
	
func set_inventory_data(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(on_inventory_interact)
	
func on_inventory_interact(inventory_data: InventoryData, index: int, button: int) -> void:
	match [grabbed_slot_data, button]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.grab_slot_data(index)
			current_index = index
	
	update_grabbed_slot()

func update_grabbed_slot() -> void:
	if grabbed_slot_data:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbed_slot_data)
	else:
		grabbed_slot.hide()


func _unhandled_input(event) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		var instance = npc_list.slot_datas[current_index].npc_data.npc_scene.instantiate()
		instance.position = get_global_mouse_position()
		add_child(instance)
	
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		grabbed_slot_data = null
		update_grabbed_slot()
		

