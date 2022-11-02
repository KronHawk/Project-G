extends Node2D

onready var player: KinematicBody2D = get_tree().get_nodes_in_group("player")[0]

func _on_Area2D_body_entered(body = player):
	get_tree().change_scene("res://scenes/MainScrem.tscn")
