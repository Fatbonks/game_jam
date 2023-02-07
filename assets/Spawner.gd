extends Node2D

var apple = preload("res://assets/apple.tscn")

var apple_location = 0
export(int) var spawn_limit

func spawn_apple():
	randomize()
	apple_location = rand_range((position.x - 1000), (position.x + 1000))
	var scene = apple.instance()
	scene.position.x = apple_location
	add_child(scene)


func _on_Timer_timeout():
	spawn_apple()
