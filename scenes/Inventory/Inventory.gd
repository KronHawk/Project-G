extends Control

const slotClass = preload("res://scenes/Inventory/Slot.gd")
onready var Inv_slots = $GridContainer
var holding_item = null

func _ready():
	var slots = Inv_slots.get_children()
	for i in range(slots.size()):
		slots[i].connect("gui_input", self, "slot_gui_input", [slots[i]])
		slots[i].slot_index = i
	initialize_iten()
		
func initialize_iten():
	var slots = Inv_slots.get_children()
	for i in range(slots.size()):
		if PlayerInventory.inventory.has(i):
			slots[i].initialize_iten(PlayerInventory.inventory[i][0], PlayerInventory.inventory[i][1])
		
func slot_gui_input(event: InputEvent, slot: slotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item:
					left_click_empty_slot(slot)
				else:
					if holding_item.item_name2 != slot.item.item_name2:
						left_click_different_item(event, slot)
					else:
						left_click_same_item(slot)
			elif slot.item:
				left_click_nothing(slot)
func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
		
func left_click_empty_slot(slot: slotClass):
	PlayerInventory.add_item_to_empty_slot(holding_item ,slot)
	slot.put_into_slot(holding_item)
	holding_item = null
	
func left_click_different_item(event: InputEvent, slot: slotClass):
	PlayerInventory.remove_item(slot)
	PlayerInventory.add_item_to_empty_slot(holding_item, slot)
	var temp_item = slot.item
	slot.pick_from_slot()
	temp_item.global_position = event.global_position
	slot.put_into_slot(holding_item)
	holding_item = temp_item
	
func left_click_same_item(slot: slotClass):
	var stack_iten = int(ItensData.item_data[slot.item.item_name2]["amount"])
	var able_to_add = stack_iten - slot.item.item_quantity
	if able_to_add >= holding_item.item_quantity:
		PlayerInventory.add_item_quantity(slot, holding_item.item_quantity)
		slot.item.add_item_quantity(holding_item.item_quantity)
		holding_item.queue_free()
		holding_item = null
	else:
		PlayerInventory.add_item_quantity(slot, able_to_add)
		slot.item.add_item_quantity(able_to_add)
		holding_item.decrese_item_quantity(able_to_add)

func left_click_nothing(slot: slotClass):
	PlayerInventory.remove_item(slot)
	holding_item = slot.item
	slot.pick_from_slot()
	holding_item.global_position = get_global_mouse_position()
