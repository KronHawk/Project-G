extends Node2D

const enemy = preload("res://scenes/enemies/enemy.tscn")
const enemymage = preload("res://scenes/enemies/EnemyMage.tscn")
onready var spawnt: Timer = get_node("SpawnTimer")
onready var delay: Timer = get_node("DelaySpawn")

func _ready():
	pass


func _on_SpawnTimer_timeout():
	var Enemy: KinematicBody2D
	var chance = randi() % 100
	if chance <= 10:
		Enemy = enemymage.instance()
	else:
		Enemy = enemy.instance()
	add_child(Enemy)
	Enemy.position = $Spawnpoint.position
	
	var area = $AreaSpawn
	var position = area.rect_position + Vector2(randf() * area.rect_size.x, randf() * area.rect_size.y)
	$Spawnpoint.position = position


func _on_VisibilityNotifier2D_viewport_entered(viewport):
	spawnt.start()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	delay.start()


func _on_DelaySpawn_timeout():
	var Enemy: KinematicBody2D
	var chance = randi() % 100
	if chance <= 10:
		Enemy = enemymage.instance()
	else:
		Enemy = enemy.instance()
	add_child(Enemy)
	Enemy.position = $Spawnpoint.position
	
	var area = $AreaSpawn
	var position = area.rect_position + Vector2(randf() * area.rect_size.x, randf() * area.rect_size.y)
	$Spawnpoint.position = position
