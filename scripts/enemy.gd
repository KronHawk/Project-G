extends KinematicBody2D
class_name enemies

onready var player: KinematicBody2D = get_tree().get_nodes_in_group("player")[0]
onready var animations: AnimatedSprite = get_node("AnimatedSprite")
onready var lifebar: TextureProgress = get_node("LifeBar/TextureProgress")
export var mana: PackedScene
onready var attack: CollisionShape2D = get_node("hitbox/CollisionShape2D")
onready var bode: CollisionShape2D = get_node("CollisionShape2D")
onready var hurt: CollisionShape2D = get_node("hurtbox/CollisionShape2D")
onready var lifetime: Timer = get_node("LifeTimer")

var moviment = Vector2.ZERO
export(int) var speed = 80
var body_targeted = null
var states = "idle"
var life = 15

func _process(delta):
	
	if states == "chase":
		if player == null:
			queue_free()
		else:
			moviment = global_position.direction_to(player.global_position)
			moviment = move_and_slide(moviment * speed)
		
	if states == "dead":
		var maana = mana.instance()
		var drop = randi() % 100
		life -= 1
		lifebar.value = life
		if life <= 0:
			speed = 0
			attack.disabled = true
			bode.disabled = true
			animations.hide()
			$Shadown.hide()
			hurt.disabled = true
			if drop <= 20:
				add_child(maana)

	if states == "none":
		move_and_slide(moviment * 0)
		
	if states == "start":
		queue_free()
	
func _on_perception_body_entered(body = player):
	body_targeted = body
	states = "chase"

func _on_hurtbox_area_entered(hitbox):
	states = "dead"

func _on_perception_body_exited(body = player):
	body_targeted = null
	states = "none"

func _on_hurtbox_area_exited(hitbox):
	states = "chase"

func _on_LifeTime_viewport_exited(viewport):
	states = "start"

