extends KinematicBody2D

onready var player: KinematicBody2D = get_tree().get_nodes_in_group("player")[0]
onready var animations: AnimatedSprite = get_node("AnimatedSprite")
export var mana: PackedScene
onready var attackway: CollisionShape2D = get_node("hitbox/CollisionShape2D")
onready var bode: CollisionShape2D = get_node("CollisionShape2D")
onready var hurt: CollisionShape2D = get_node("hurtbox/CollisionShape2D")
onready var power: AnimationPlayer = get_node("Power")
onready var power1: Area2D = get_node("power1")
export var drop: PackedScene

var moviment = Vector2.ZERO
export(int) var speed = 30
var body_targeted = null
var states = "idle"
var life = 10
var can_power = true

func _process(delta):
	
	if moviment.x > 0 and animations.flip_h:
		animations.flip_h = false
	elif moviment.x < 0 and not animations.flip_h:
		animations.flip_h = true
	
	if states == "chase":
		if player == null:
			queue_free()
		else:
			moviment = global_position.direction_to(player.global_position)
			moviment = move_and_slide(moviment * speed)
		
	if states == "dead":
		var maana = mana.instance()
		var sword = drop.instance()
		var drop = randi() % 100
		life -= 1
		if life <= 0:
			speed = 0
			attackway.queue_free()
			bode.queue_free()
			animations.hide()
			hurt.queue_free()
			power1.queue_free()
			$Sprite.queue_free()
			if drop > 1000:
				add_child(maana)
			elif drop <= 100:
				add_child(sword)
		
	if states == "none":
		move_and_slide(moviment * 0)
		
	if states == "start":
		queue_free()
	
	if states == "power":
		if not power.is_playing():
			power.play("special_attack")


func _on_hurtbox_area_entered(hitbox):
	states = "dead"


func _on_hurtbox_area_exited(hitbox):
	states = "chase"


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	states = "start"


func _on_percption_body_entered(body = player):
	body_targeted = body
	states = "chase"


func _on_percption_body_exited(body = player):
	body_targeted = null
	states = "none"


func _on_power1_body_entered(body = player):
	states = "power"

