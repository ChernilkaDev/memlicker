# Главный скрипт профиля персонажа
# Думаю расписывать что да как нет смысла, тут чуть понятно что к чему(говнокод)

signal unlockcharacter(character)

extends Control

onready var ButtonUnlock = $UnlockBut
onready var ButtonLevelUp = $Upgrade/LevelUp
onready var ProgressBarLevel = $Upgrade/Level
onready var LevelNumber = $Upgrade/LevelNumber
onready var cardsprogress = $Upgrade/Copies
onready var textcopies = $Upgrade/CardsNumber
onready var sound = $Sound

var link_ytcase = "https://www.youtube.com/@redcasement"
var current_copies_number
var current_level

var profilechar
var statusunlock
var raritychar


onready var Rarity = {
	"doge": "default",
	"chaika": "legendary",
	"sanic": "default",
	"dogweno": "unusual",
	"hamster": "unusual",
	"sigma": "legendary",
	"trollface": "legendary",
	"chillguy": "legendary",
	"clippy": "unusual",
	"amogus": "unusual",
}

onready var texturesunlock = {
	"20g": load("res://Textures/UnlockButton/20.png"),
	"40g": load("res://Textures/UnlockButton/40.png"),
	"80g": load("res://Textures/UnlockButton/80.png"),
}

onready var sounds = {
	"click": load("res://Audio/Sounds/Click-Sound-Effect.mp3"),
	"buy": load("res://Audio/Sounds/money-soundfx.mp3"),
}

func _process(delta):
	profilechar = GlobalVars.character_profile
	check_cards()
	check_active()


func check_active():
	var charactersunlock = GlobalVars.Characters_Unlock
	var profile_key = GlobalVars.character_profile
	
	if profile_key in charactersunlock:
		var unlock = charactersunlock[profile_key]
		if unlock:
			ButtonLevelUp.disabled = false
			check_level()
		elif !unlock:
			check_level()
			ButtonLevelUp.disabled = true	

func check_level():
	var values = GlobalVars.Characters_Upgrade
	var profile_key = GlobalVars.character_profile

	if profile_key in values:
		var level = values[profile_key]
		current_level = level
		#print("Level for character profile " + profile_key + ": " + level)
		if level == "1":
			ButtonLevelUp.disabled = false
			LevelNumber.text = "1/3"
			ProgressBarLevel.value = 0
		elif level == "2":
			ButtonLevelUp.disabled = false
			LevelNumber.text = "2/3"
			ProgressBarLevel.value = 50
		elif level == "3":
			ButtonLevelUp.disabled = true
			LevelNumber.text = "3/3"
			ProgressBarLevel.value = 100
		elif level == "6":
			ButtonLevelUp.disabled = true
			LevelNumber.text = "6/6"
			ProgressBarLevel.value = 100

func check_cards():
	unlockcharacter()
	var values_upgrade = GlobalVars.Characters_Upgrade
	var values = GlobalVars.Characters_Cards
	var profile_key = GlobalVars.character_profile
	
	if profile_key in values_upgrade:
		var upgrade = int(values_upgrade[profile_key])
		if upgrade == 1:
			textcopies.text = str(values[profile_key]) + "/5"
		elif upgrade == 2:
			textcopies.text = str(values[profile_key]) + "/7"
		elif upgrade == 3:
			textcopies.text = str(values[profile_key]) + "/0"
			cardsprogress.value = 0
		elif upgrade == 6:
			textcopies.text = str(values[profile_key]) + "/0"
			cardsprogress.value = 0
	
	if profile_key in values:
		var copies = int(values[profile_key])
		current_copies_number = copies
		#print(current_copies_number)
		# Проверяем значение upgrade и устанавливаем cardsprogress.value на основе этого
		if profile_key in values_upgrade:
			var upgrade = int(values_upgrade[profile_key])
			if upgrade == 1:
				if copies == 0:
					cardsprogress.value = 0
				elif copies == 1:
					cardsprogress.value = 20
				elif copies == 2:
					cardsprogress.value = 40
				elif copies == 3:
					cardsprogress.value = 60
				elif copies == 4:
					cardsprogress.value = 80
				elif copies == 5:
					cardsprogress.value = 100
			elif upgrade == 2:
				if copies == 0:
					cardsprogress.value = 0
				elif copies == 1:
					cardsprogress.value = 20
				elif copies == 2:
					cardsprogress.value = 30
				elif copies == 3:
					cardsprogress.value = 50
				elif copies == 4:
					cardsprogress.value = 60
				elif copies == 5:
					cardsprogress.value = 70
				elif copies == 6:
					cardsprogress.value = 80
				elif copies == 7:
					cardsprogress.value = 100
		
		#print("Персонаж: ", profile_key, " ", "Карты: ", values[profile_key])


func upgrade_level():
	var values_cards = GlobalVars.Characters_Cards
	var values = GlobalVars.Characters_Upgrade
	var profile_key = GlobalVars.character_profile
	
	print("Values before: ", values)
	print("Values Cards before: ", values_cards)
	
	if profile_key in values:
		var level = int(values[profile_key])
		var current_level = int(level)
		var current_copies_number = int(values_cards[profile_key])
		
		if GlobalVars.MemCoin >= 200 and current_level == 1 and current_copies_number == 5 or current_level == 2 and current_copies_number == 7:
			GlobalVars.MemCoin -= 200
			
			if level < 3:
				if current_level == 1:
					current_copies_number -= 5
					level += 1
				elif current_level == 2:
					current_copies_number -= 7
					level += 1
				elif current_level == 3:
					current_copies_number -= 7
				
				values_cards[profile_key] = str(current_copies_number)
				values[profile_key] = str(level)
				
				print("Values after: ", values)
				print("Values Cards after: ", values_cards)
				
				check_level()

func _on_LevelUp_pressed():
	upgrade_level()

func _on_youtube_pressed():
	OS.shell_open(link_ytcase)

func unlockcharacter():
	var unlock_status = GlobalVars.Characters_Unlock.get(profilechar, null)
	var rarity_status = Rarity.get(profilechar, null)
	statusunlock = unlock_status
	raritychar = rarity_status
	
	# Проверяем, найдено ли значение и выводим результат в консоль
	if unlock_status != null:
		#print("Статус разблокировки персонажа ", profilechar, ": ", unlock_status)
		#print(rarity_status)
		if !unlock_status and rarity_status == "default":
			#print("default test")
			ButtonUnlock.texture_normal = texturesunlock["20g"]
			ButtonUnlock.visible = true
		elif !unlock_status and rarity_status == "unusual":
			#print("unusual test")
			ButtonUnlock.texture_normal = texturesunlock["40g"]
			ButtonUnlock.visible = true
		elif !unlock_status and rarity_status == "legendary":
			#print("legendary test")
			ButtonUnlock.texture_normal = texturesunlock["80g"]
			ButtonUnlock.visible = true
		else:
			ButtonUnlock.visible = false
			

func _on_UnlockBut_pressed():
	#print(statusunlock)
	#print(raritychar)
	#print(profilechar)
	if raritychar == "default" and GlobalVars.GemCoin >= 20:
		GlobalVars.GemCoin -= 20
		sound.stream = sounds.buy
		sound.play()
		emit_signal("unlockcharacter", profilechar)
	elif raritychar == "unusual" and GlobalVars.GemCoin >= 40:
		GlobalVars.GemCoin -= 40
		sound.stream = sounds.buy
		sound.play()
		emit_signal("unlockcharacter", profilechar)
	elif raritychar == "legendary" and GlobalVars.GemCoin >= 80:
		GlobalVars.GemCoin -= 80
		sound.stream = sounds.buy
		sound.play()
		emit_signal("unlockcharacter", profilechar)
	else:
		sound.stream = sounds.click
		sound.play()
