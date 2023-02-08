extends Area2D


func _process(_delta):
	position.y += 8


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
