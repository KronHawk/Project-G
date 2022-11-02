extends Node2D

onready var spawn: Position2D = get_node("Position2D")
export var player: PackedScene

func _ready():
	var player0 = player.instance()
	player0.position = spawn.position
	add_child(player0)
