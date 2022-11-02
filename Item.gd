extends Node2D

var item_name2
var item_quantity

func _ready():
	randomize()
	var rand_vel = randi() % 4
	if rand_vel == 0:
		item_name2 = "10001"
	elif rand_vel == 1:
		item_name2 = "10002"
	elif rand_vel == 2:
		item_name2 = "10003"
	elif rand_vel == 3:
		item_name2 = "10004"
	elif rand_vel == 4:
		item_name2 = "10003"
	
	$TextureRect.texture = load("res://assets/Item/" + item_name2 + ".png")
	$TextureRect.expand = true
	var stack_size = int(ItensData.item_data[item_name2]["amount"])
	item_quantity = randi() % stack_size + 1
	
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.text = String(item_quantity)
	
func set_item(nm, qt):
	item_name2 = nm
	item_quantity = qt
	$TextureRect.texture = load("res://assets/Item/" + item_name2 + ".png")
	
	var stack_size = int(ItensData.item_data[item_name2]["amount"])
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.visible = true
		$Label.text = String(item_quantity) 
	
func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)
	
func decrese_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)
