extends CharacterBody2D

const SPEED = 100
var playerDir = "none"
@onready var char: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	player_movement(delta)
	
	
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		play_anim(1)
		playerDir = 'right'
		velocity.x = SPEED
		velocity.y = 0
		
	elif Input.is_action_pressed("ui_left"):
		play_anim(1)
		playerDir = 'left'
		velocity.x = -SPEED
		velocity.y = 0
	
	elif Input.is_action_pressed("ui_up"):
		play_anim(1)
		playerDir = 'up'
		velocity.y = -SPEED
		velocity.x = 0
		
	elif Input.is_action_pressed('ui_down'):
		play_anim(1)
		playerDir = 'down'
		velocity.y = SPEED
		velocity.x = 0
	
	elif Input.is_action_pressed('special'):
		play_anim(2)
		velocity.x = 0
		velocity.y = 0
	
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = playerDir
	var anim = char
	
	if dir == 'right':
		char.flip_h = true
		if movement == 1:
			char.play("walk")
		elif movement == 2:
			char.play("special")
		else:
			char.play("idle")
	
	elif dir == 'left':
		char.flip_h = false
		if movement == 1:
			char.play("walk")
		elif movement == 2:
			char.play("special")
		else:
			char.play("idle")
	
	elif dir == 'up':
		char.flip_h = false
		if movement == 1:
			char.play("walk_up")
		elif movement == 2:
			char.play("special_up")
		else:
			char.play("idle_up")
	
	elif dir == 'down':
		char.flip_h = false
		if movement == 1:
			char.play("walk_down")
		elif movement == 2:
			char.play("special_down")
		else:
			char.play("idle_down")
		
	
