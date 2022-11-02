extends KinematicBody2D
class_name player

enum {UP, DOWN}

var status
var current_weapons: Node2D
onready var sword: Node2D = get_node("Weapons")
onready var animation: AnimationPlayer = get_node("AnimationPlayer")
onready var playeranimation: AnimatedSprite = get_node("AnimatedSprite")
onready var lifebar: TextureProgress = get_node("LifeBar/Node2D/LifeBarTex/ProgressTex")

var moviment = Vector2.ZERO
var test
var life = 5
export(int) var speed = 100

func _ready():
	current_weapons = sword.get_child(0)

func _physics_process(delta):
	var mouse_direction = Vector2(get_global_mouse_position() - global_position).normalized()
	if mouse_direction.x > 0 and playeranimation.flip_h:
		playeranimation.flip_h = false
	elif mouse_direction.x < 0 and not playeranimation.flip_h:
		playeranimation.flip_h = true
		
	current_weapons.weapon_angle(mouse_direction)
	move()
	
func move() -> void:
	moviment.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	moviment.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	move_and_slide(moviment * speed).normalized()
	
	if moviment != Vector2.ZERO:
		playeranimation.play("run")
	elif moviment == Vector2.ZERO:
		playeranimation.play("idle")
		
	if Input.is_action_just_released("troca_arma_up"):
		_switch_weapon(UP)
	elif Input.is_action_just_released("troca_arma_down"):
		_switch_weapon(DOWN)
		
	current_weapons.attack()

func _on_hurtbox_area_entered(hitbox):
	life -= 0
	lifebar.value = life
	if life == 0:
		get_tree().change_scene("res://scenes/MainScrem.tscn")

func _on_itens_area_entered(mana):
	life += 3

func _switch_weapon(direction: int):
	var index: int = current_weapons.get_index()
	if direction == UP:
		index -= 1
		if index < 0:
			index = current_weapons.get_child_count() - 1
	else:
		index += 1
		if index > current_weapons.get_child_count() - 1:
			index = 0
			
	current_weapons.hide()
	current_weapons = sword.get_child(index)
	current_weapons.show()
