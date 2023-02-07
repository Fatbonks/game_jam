extends Area2D

export(String, FILE) var next_level:String = ""

export(bool) var use_key:bool = false

var have_key:bool = false
var in_range_of_door = false
onready var _event = EventBus.connect("have_key", self, "key")



func _process(_delta):
	
	
	if in_range_of_door == true and Input.is_action_pressed("Interact") and use_key == true:
			if have_key == true:
				var _scene = get_tree().change_scene(next_level)
	elif in_range_of_door == true and Input.is_action_pressed("Interact") and use_key == false:
		var _scene = get_tree().change_scene(next_level)

func _on_door_body_entered(body):
	if body.is_in_group("player"):
		in_range_of_door = true

func _on_door_body_exited(body):
	if body.is_in_group("player"):
		in_range_of_door = false

func _on_Key_found_key():
	have_key = true


