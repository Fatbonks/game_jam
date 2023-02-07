extends Area2D

signal found_key


func _on_Key_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("found_key")
		EventBus.emit_signal("play_pickup_sound")
		queue_free()
