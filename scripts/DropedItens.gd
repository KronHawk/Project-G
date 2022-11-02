extends Area2D

var itens_in_range = {}

func _on_DropedItens_area_entered(drop):
	itens_in_range[drop] = drop

func _on_DropedItens_area_exited(drop):
	if itens_in_range.has(drop):
		itens_in_range.erase()
