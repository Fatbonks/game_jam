extends Area2D


func _on_Diamond_body_entered(_body):
	EventBus.emit_signal("addCoins")
	EventBus.emit_signal("play_pickup_sound")
	queue_free()
