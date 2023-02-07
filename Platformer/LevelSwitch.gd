extends Node2D

export(String, FILE) var next_level:String = ""
onready var fade = $AnimationPlayer
onready var music = $AudioStreamPlayer
var lerp_music = false

func _on_Play_pressed():
	fade.play("Fade_in")
	lerp_music = true

func _process(_delta):
	if lerp_music == true:
		music.volume_db = lerp(music.volume_db, -60, 0.01)

func _on_Exit_pressed():
	get_tree().quit()


func _on_AnimationPlayer_animation_finished(_anim_name):
	var _scene = get_tree().change_scene(next_level)
