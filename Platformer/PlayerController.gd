extends KinematicBody2D

onready var pickup = $pickup
onready var dashtimer = $Timer
onready var sprite = $Sprite
onready var jumpSound = $jump
onready var dashSound = $dash
onready var cointext = $Coins/Label
onready var key_found = $key
onready var death_count = $Coins/death_count
var coin = 0
var speed = 100
var gravity = 20
var motion = Vector2()
var horizontalInput
var JumpForce = -280
var dashspeed = 200
var dashLength = 0.2
var isdashing = false
var resetYvel = true
var unlockdash = false
var unlockdoublejump = false
var doublejump = true
var candash = true
onready var animation = $AnimationTree
onready var state_machine = animation.get("parameters/playback")
func _ready():
	death_count.text = "Death: " + str(EventBus.death_count)
	scale = Vector2(1, 1)
	var _event = EventBus.connect("damaged", self, "hit")
	var _event2 = EventBus.connect("addCoins", self, "addcoins")
	var _event3 = EventBus.connect("play_pickup_sound", self, "play_sound")

func _process(_delta):
	motion.y += gravity
	horizontalInput = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	
	if Input.is_action_just_pressed("Dash") and isdashing == false and candash == true and unlockdash == true:
		dashing(dashLength)
		candash = false
		state_machine.travel("Dash")
	if unlockdoublejump == true:
		if Input.is_action_just_pressed("Jump") and !is_on_floor() and doublejump == true and !is_on_wall():
			motion.y = JumpForce
			doublejump = false
			jumpSound.play()
	
	if horizontalInput == 0 and isdashing == false:
		motion.x = 0
		
	if horizontalInput == -1:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	if horizontalInput ==  0 and is_on_floor():
		state_machine.travel("idle")
	
	if horizontalInput == 1 or horizontalInput == -1 and is_on_floor():
		state_machine.travel("Run")
	if isdashing == false:
		motion.x = horizontalInput * speed
		
	if is_on_floor() and Input.is_action_just_pressed("Jump") and !is_on_wall():
		motion.y = JumpForce
		jumpSound.play()
	
	if !is_on_floor() and isdashing == false:
		state_machine.travel("Jump")
	
	if is_on_wall() and horizontalInput != 0:
		if resetYvel == true:
			motion.y = 0
			resetYvel = false
		gravity = 1
	else:
		resetYvel = true
	
	if !is_on_wall():
		gravity = 20
	motion = move_and_slide(motion, Vector2.UP)
	
	if is_on_floor():
		doublejump = true
		candash = true
	
	
func dashing(dur):
	
	
	isdashing = true
	gravity = 0
	motion.x += dashspeed * horizontalInput
	dashtimer.wait_time = dur
	dashtimer.start()
	if horizontalInput != 0:
		dashSound.play()

func hit():
	EventBus.death_count += 1
	var _scene = get_tree().reload_current_scene()
	
func addcoins():
	coin += 1
	cointext.text = str(coin) + " / 7"
	if get_tree().current_scene.name == "Lvl1":
		EventBus.lvl1_diamond += 1
	if get_tree().current_scene.name == "Lvl2":
		EventBus.lvl2_diamond += 1
	if get_tree().current_scene.name == "Lvl3":
		EventBus.lvl2_diamond += 1

func play_sound():
	pickup.play()

func _on_Timer_timeout():
	isdashing = false


func _on_Key_found_key():
	key_found.visible = true

