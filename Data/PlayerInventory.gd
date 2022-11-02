extends Node

const slotClass = preload("res://scenes/Inventory/Slot.gd")
const itemClass = preload("res://Item.gd")
const MAX_NUM_SLOTS = 20

var inventory = {
	0: ["10001", 1],
	1: ["10003", 1],
	2: ["10004", 1]
}
	
func _ready():
	pass
	
func add_item(item_name, item_quantity):
	for item in inventory:
		if inventory[item][0] == item_name:
			var stack_size = int(ItensData.item_data[item_name]["amount"])
			var able_to_add = stack_size - inventory[item][1]
			if able_to_add >= item_quantity:
				inventory[item][1] += item_quantity
				update_slot_visual(item, inventory[item][0], inventory[item][1])
				return
			else:
				inventory[item][1] += able_to_add
				update_slot_visual(item, inventory[item][0], inventory[item][1])
				item_quantity = item_quantity - able_to_add
	
	for i in range(MAX_NUM_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name, item_quantity]
			update_slot_visual(i, inventory[i][0], inventory[i][1])
			return
	
func update_slot_visual(item_index, item_name, new_quantity):
	var slot = get_tree().root.get_node("/root/Inv/GridContainer/Slot" + str(item_index + 1))
	if slot.item != null:
		slot.item.set_item(item_name, new_quantity)
	else:
		slot.initialize_iten(item_name, new_quantity)
	
func add_item_to_empty_slot(item: itemClass, slot: slotClass):
	inventory[slot.slot_index] = [item.item_name2, item.item_quantity]
	
func remove_item(slot: slotClass):
	inventory.erase(slot.slot_index)
	
func add_item_quantity(slot: slotClass, quantity_to_add: int):
	inventory[slot.slot_index][1] += quantity_to_add
