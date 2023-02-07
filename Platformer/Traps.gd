extends Area2D



func _on_Traps_body_entered(body):
	if body.is_in_group("player"):
		EventBus.emit_signal("damaged")
