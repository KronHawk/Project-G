extends Panel

var defoult_tex = preload("res://assets/Inventory/Items.png")
var empty_tex = preload("res://assets/Inventory/Items.png")
var empty_style: StyleBoxTexture = null
var defoult_style: StyleBoxTexture = null

var itemClass = preload("res://scenes/Inventory/Slot/Item.tscn")
var item = null
var slot_index

func _ready():
	defoult_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	defoult_style.texture = defoult_tex
	empty_style.texture = empty_tex 
#	if randi() % 2 == 0:
#		item = itemClass.instance()
#		item.position = Vector2(20, 20)
#		add_child(item)
	refresh_style()
	
func refresh_style():
	if item == null:
		set('custon_styles/panel', empty_style)
	else:
		set('custon_styles/panel', defoult_style)
	
func pick_from_slot():
	remove_child(item)
	var inventory_node = find_parent("Inv")
	inventory_node.add_child(item)
	item = null
	refresh_style()
	
func put_into_slot(new_item):
	item = new_item
	item.position = Vector2(20, 20)
	var inventory_node = find_parent("Inv")
	inventory_node.remove_child(item)
	add_child(item)
	refresh_style()
	
func initialize_iten(itemName, itenQuantity):
	if item == null:
		item = itemClass.instance()
		add_child(item)
		item.set_item(itemName, itenQuantity)
		item.position = Vector2(20, 20)
	else:
		item.set_item(itemName, itenQuantity)
		item.position = Vector2(20, 20)
	refresh_style()
