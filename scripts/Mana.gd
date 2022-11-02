extends Node2D

func _ready():
	PlayerInventory.add_item("10003", 1)
	pass

func _on_mana_area_entered(itens):
	$mana/CollisionShape2D.disabled = true
	$AnimatedSprite.hide()
	$mana.queue_free()
	
