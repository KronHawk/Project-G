extends Area2D

export var player: PackedScene
onready var tilemap = $TileMap

func _ready():
	pass


func _on_Area2D_body_exited(body = player):
	tilemap.set_cell(get_parent().position.x, get_parent().position.y, 0)
