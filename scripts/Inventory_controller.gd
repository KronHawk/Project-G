extends Node2D
class_name InventoryCont

var items = {
	"items": {
		"name": "..."
	}
}

func save():
	var file = File.new()
	file.open("res://scenes/Invetory/Item.json", File.WRITE)
	file.store_line(to_json(items))
	file.close()

func _ready():
	print(items)
