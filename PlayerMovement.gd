extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# export var b = "text"

export var speed = 200

var velocity = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_up"): # Negative numbers go up
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	velocity.x = direction.x * speed
	velocity.y = direction.y * speed
	velocity = move_and_slide(velocity, Vector2.LEFT)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
