extends CanvasLayer



func _input(event):
	if event.is_action_pressed("inventory"):
		$Inv.visible = !$Inv.visible
		$Inv.initialize_iten()

func _ready():
	pass
