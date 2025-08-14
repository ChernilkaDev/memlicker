extends Control

signal unlock(promocode_key)

onready var MusicCheck = $Music
onready var SoundCheck = $Sound
onready var PromoLabel = $PromoLabel
onready var AnimError = $Animation
onready var SkipCheck = $Skipload
var TextLabel = ""

var promocodes = { # Промокоды для разблокировки персонажей, ну или выдача наград за ввод других кодов
	"tabick": "etoti_promo",
	"xapn": "xapn_top",
	"chernilka": "dried_ink",
	"chinda": "sigma_34",
	"mops": "xmopser",
	"pivo": "baltika05",
	"lenin": "leninfreeok",
	"obnova": "redcasement",
	"winter": "newyear2025"
}

# Инициализируем used_promocodes глобальной переменной при старте
var used_promocodes = []

func _ready():
	SkipCheck.pressed = GlobalVars.skipfakeload
	SoundCheck.pressed = GlobalVars.SoundStatus
	MusicCheck.pressed = GlobalVars.MusicStatus
	if GlobalVars.used_promocodes_list:
		used_promocodes = GlobalVars.used_promocodes_list


func _process(delta):
	TextLabel = PromoLabel.text


func _on_Agree_pressed():
	if used_promocodes.has(TextLabel):
		print("Этот промокод уже использован:", TextLabel)
		AnimError.play("ErrorHaveCode")
		return
	
	if TextLabel == "newyear2025":  # Проверка специального промокода
		if used_promocodes.has(TextLabel):  # Проверка, использован ли промокод
			print("Этот промокод уже использован:", TextLabel)
			AnimError.play("ErrorHaveCode")
			return
		print("Получен специальный промокод:", TextLabel)
		GlobalVars.MemCoin += 500
		used_promocodes.append(TextLabel)  # Помечаем промокод как использованный
		GlobalVars.used_promocodes_list = used_promocodes  # Обновляем глобальную переменную
		return  # Завершаем выполнение, чтобы не вызвать emit_signal
		
	if promocodes.has(TextLabel):  # Для других промокодов
		print("Промокод совпал с ключом:", TextLabel)
		used_promocodes.append(TextLabel)
		GlobalVars.used_promocodes_list = used_promocodes
		emit_signal("unlock", TextLabel)
	elif promocodes.values().has(TextLabel):
		for key in promocodes.keys():
			if promocodes[key] == TextLabel:
				if used_promocodes.has(key):
					print("Этот промокод уже использован:", key)
					AnimError.play("ErrorHaveCode")
					return
				print("Соответствующий ключ:", key)
				used_promocodes.append(key)
				GlobalVars.used_promocodes_list = used_promocodes
				emit_signal("unlock", key)
				break
	else:
		AnimError.play("ErrorCode")




func _on_Skipload_toggled(button_pressed):
	if button_pressed == true:
		GlobalVars.skipfakeload = true
	elif button_pressed == false:
		GlobalVars.skipfakeload = false

func _on_Music_toggled(button_pressed):
	if button_pressed == true:
		GlobalVars.MusicStatus = true
	elif button_pressed == false:
		GlobalVars.MusicStatus = false

func _on_Sound_toggled(button_pressed):
	if button_pressed == true:
		GlobalVars.SoundStatus = true
	elif button_pressed == false:
		GlobalVars.SoundStatus = false
