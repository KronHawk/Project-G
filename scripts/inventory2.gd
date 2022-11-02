extends Control

var inventory_slot_pre = preload("res://scenes/Invetory/Templates/inv1.tscn")
onready var gridcontainer = get_node("Backgroung/M/V/ScrollContainer/GridContainer")

func _ready():
	for i in InvData.inv_data.keys():
		var inv_new_slot = inventory_slot_pre.instance()
		if InvData.inv_data[i]["item"] != null:
			var item_name = GameData.itemdata[str(InvData.inv_data[i]["item"])]["Name"]
			var icon_texture = load("res://assets/Weapons/" + item_name + ".png")
			inv_new_slot.get_node("icon").set_texture(icon_texture)
		gridcontainer.add_child(inv_new_slot, true)
