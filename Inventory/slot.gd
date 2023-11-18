extends PanelContainer

signal slot_clicked(index: int, button: int)

@onready var texture_rect = $MarginContainer/TextureRect

func set_slot_data(slot_data: SlotData) -> void:
	var npc_data = slot_data.npc_data
	texture_rect.texture = npc_data.portrait

func _on_gui_input(event) -> void:
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.is_pressed():
			slot_clicked.emit(get_index(), event.button_index)
