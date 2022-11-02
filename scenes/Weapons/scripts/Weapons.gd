extends Node2D
class_name Weapons

onready var animationplayer: AnimationPlayer = get_node("Node2D/AnimationPlayer")

var life = 0
export(int) var demage = 0

func _ready():
	pass

func Damege(life) -> void:
	life += demage

func weapon_angle(mouse_direction: Vector2):
	if not animationplayer.is_playing():
		rotation = mouse_direction.angle()
		if scale.y == 1 and mouse_direction.x < 0:
			scale.y = -1
		elif scale.y == -1 and mouse_direction.x > 0:
			scale.y = 1

func attack():
	Input.get_action_strength("attack")
	Input.get_action_strength("change_attack")
	
	if Input.get_action_strength("attack") and not animationplayer.is_playing():
		animationplayer.play("attack")
#	elif Input.get_action_strength("change_attack") and not animationplayer.is_playing():
#		animationplayer.play("charge_attack")
