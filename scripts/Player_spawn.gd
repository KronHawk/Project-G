extends Position2D

export var player: PackedScene

func _ready():
	var PLAYER = player.instance()
	add_child(PLAYER)
