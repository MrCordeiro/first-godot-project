extends KinematicBody2D

var score : int = 0

var speed : int = 400
var jumpForce : int = 600
var gravity : int = 800

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	
	vel.x = 0
	
	# Movement inputs
	if Input.is_action_pressed("move_left"):
			vel.x -= speed
	if Input.is_action_pressed("move_right"):
			vel.x += speed
			
	# Applying the velocity
	# move_and_slide() method moves the body along a given vector, and if the 
	# body collides with another, it will slide along the other body. This is 
	# especially useful in platformers or top-down games.
	vel = move_and_slide(vel, Vector2.UP)
	
	# Gravity
	vel.y += gravity * delta
	
	# Jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	# Sprite direction
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
