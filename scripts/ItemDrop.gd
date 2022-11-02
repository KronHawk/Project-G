extends KinematicBody2D

var item_name

func _ready():
	item_name = "10002"
	PlayerInventory.add_item(item_name, 1)
	
func _on_drop_area_entered(DropedItens):
	$Sprite.queue_free()
	$drop/CollisionShape2D.queue_free()
	$CollisionShape2D.queue_free()
	get_parent().queue_free()
	
