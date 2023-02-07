extends Node2D

var apple = preload("res://assets/apple.tscn")

var apple_location = 0


func _process(_delta):
	randomize()
	apple_location = rand_range((position.x - 1000), (position.x + 1000))
	var scene = apple.instance()
	scene.position.x = apple_location
	add_child(scene)
