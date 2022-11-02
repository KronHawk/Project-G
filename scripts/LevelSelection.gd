extends Node2D



func _on_Button_pressed():
	get_tree().change_scene("res://scenes/MainScene.tscn")


func _on_Button_mouse_entered():
	$ManaLevel/Button/Sprite.modulate.r = 1
	$ManaLevel/Button/Sprite.modulate.g = 1
	$ManaLevel/Button/Sprite.modulate.b = 1
	$ManaLevel/Button/Sprite.scale.y = 11
	$ManaLevel/Button/Sprite.scale.x = 7.8


func _on_Button_mouse_exited():
	
	$ManaLevel/Button/Sprite.modulate.r = 0.7
	$ManaLevel/Button/Sprite.modulate.g = 0.7
	$ManaLevel/Button/Sprite.modulate.b = 0.7
	$ManaLevel/Button/Sprite.scale.y = 12.229
	$ManaLevel/Button/Sprite.scale.x = 8.939

