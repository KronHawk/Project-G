extends Node2D

export var dungeon: PackedScene

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/LevelSelection.tscn")


func _on_Button_mouse_entered():
	$Node2D/Button/Sprite.modulate.r = 1
	$Node2D/Button/Sprite.modulate.g = 1
	$Node2D/Button/Sprite.modulate.b = 1
	$Node2D/Button/Sprite.scale.y = 8.5
	$Node2D/Button/Sprite.scale.x = 7.5

func _on_Button_mouse_exited():
	$Node2D/Button/Sprite.modulate.r = 0.7
	$Node2D/Button/Sprite.modulate.g = 0.7
	$Node2D/Button/Sprite.modulate.b = 0.7
	$Node2D/Button/Sprite.scale.y = 9.625
	$Node2D/Button/Sprite.scale.x = 8
