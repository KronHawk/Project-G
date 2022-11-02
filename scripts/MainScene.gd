extends Node2D

const SPAWN_ROOMS: Array = [preload("res://scenes/Dungeons/Dungeon1.tscn"), preload("res://scenes/Dungeons/Dungeon2.tscn"),
preload("res://scenes/Dungeons/Dungeon3.tscn"), preload("res://scenes/Dungeons/Dungeon4.tscn"),
preload("res://scenes/Dungeons/Dungeon5.tscn")]

const INTERMEDIATE_ROOM: Array = [preload("res://scenes/IntermediateRoom/RoomGame1.tscn"), preload("res://scenes/IntermediateRoom/RoomGame2.tscn"),
preload("res://scenes/IntermediateRoom/RoomGame3.tscn"), preload("res://scenes/IntermediateRoom/RoomGame4.tscn"),
preload("res://scenes/IntermediateRoom/RoomGame5.tscn")]

const END_ROOM: Array = [preload("res://scenes/EndRoom/EndRoom.tscn")]

const TileSize = 32
const FLOOR_TILE_INDEX: int = 0

onready var num_level = 1

export var player: PackedScene

func _ready():
	randomize()
	_spawn_roons()
	
func _spawn_roons():
	var previus_room: Node2D
	
	for i in num_level:
		var room: Node2D
		room = SPAWN_ROOMS[randi() % SPAWN_ROOMS.size()].instance()
		
		add_child(room)
		previus_room = room
	
