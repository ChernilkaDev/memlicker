signal ended # Скрипт запуска заставки
extends Control

onready var Anim = $Anim
onready var Sound = $Sound

func _on_Load_Load_end():
	if GlobalVars.skipfakeload == false:
		Anim.play("Skip")
	else:
		Sound.play()
		Anim.play("Loading")


func _on_Anim_animation_finished(anim_name):
	if anim_name == "Skip":
		emit_signal("ended")
	elif anim_name == "Loading":
		emit_signal("ended")
