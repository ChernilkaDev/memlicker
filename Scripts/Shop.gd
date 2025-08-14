# Думаю тут объяснять не надо

signal buy_sphere

extends Control

onready var Anim_C = $NoCoinsAnim
onready var Anim_G = $NoGemsAnim
onready var Sound_Effect = $SoundMonToGem

func _on_MonToGem_pressed():
	if GlobalVars.MemCoin >= 40:
		Sound_Effect.play()
		GlobalVars.GemCoin += 1
		GlobalVars.MemCoin -= 40
	else:
		Anim_C.play("NoCoinsAnim")


func _on_RandomSphereBuy_pressed():
	if GlobalVars.GemCoin >= 10:
		emit_signal("buy_sphere")
		GlobalVars.GemCoin -= 10
	else:
		Anim_G.play("NoGemsAnim")


func _on_K500_pressed():
	if GlobalVars.GemCoin >= 500000:
		GlobalVars.GemCoin -= 500000
	else:
		Anim_G.play("NoGemsAnim")
