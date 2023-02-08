extends Node2D

onready var cooldown = $cooldown

var apple = preload("res://assets/Apple/apple.tscn")

var apple_location = Vector2()
export(int) var spawn_limit
var limit = 0
var cooldown_has_started = false
func _process(_delta):
	if limit == spawn_limit and cooldown_has_started == false:
		cooldown.start()
		cooldown_has_started = true

func spawn_apple():
	randomize()
	apple_location.x = rand_range(global_position.y, 256)
	var scene = apple.instance()
	scene.position = apple_location
	add_child(scene)


func _on_Timer_timeout():
	if limit != spawn_limit:
		print(limit)
		spawn_apple()
		limit += 1


func _on_cooldown_timeout():
	limit = 0
	spawn_limit += spawn_limit * 1.3
	cooldown_has_started = false
