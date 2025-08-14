# Скрипти разблокировки персонажей(вроде за гемкоины)

extends Control

onready var BG_RARITY = $ColorRarity
onready var CharacterTexture = $Size/Character
onready var Animation = $AnimUnlock
onready var Name = $CharacterText
onready var ButtonClose = $Close

var unlockchar = "chaika"
var rarity = "Default"

var characters_data = {
	"chaika": {
		"texture": load("res://Textures/Characters/Unlock/chaika.png"),
		"name": "Чайка",
		"rarity": "Legendary"
	},
	"trollface": {
		"texture": load("res://Textures/Characters/Unlock/trollface.png"),
		"name": "Троллфейс",
		"rarity": "Legendary"
	},
	"doge": {
		"texture": load("res://Textures/Characters/Unlock/doge.png"),
		"name": "Доге",
		"rarity": "Default"
	},
	"tabick": {
		"texture": load("res://Textures/Characters/Unlock/tabick.png"),
		"name": "Табик",
		"rarity": "Special"
	},
	"xapn": {
		"texture": load("res://Textures/Characters/Unlock/xapn.png"),
		"name": "Харп",
		"rarity": "Special"
	},
	"pivo": {
		"texture": load("res://Textures/Characters/Unlock/pivo.png"),
		"name": "Бочка с пивом",
		"rarity": "Special"
	},
	"mops": {
		"texture": load("res://Textures/Characters/Unlock/mops.png"),
		"name": "Мопс",
		"rarity": "Special"
	},
	"sanic": {
		"texture": load("res://Textures/Characters/Unlock/sanic.png"),
		"name": "Саник",
		"rarity": "Default"
	},
	"dogweno": {
		"texture": load("res://Textures/Characters/Unlock/dogweno.png"),
		"name": "Собака",
		"rarity": "Unusual"
	},
	"chinda": {
		"texture": load("res://Textures/Characters/Unlock/chinda.png"),
		"name": "Чичинда",
		"rarity": "Special"
	},
	"chernilka": {
		"texture": load("res://Textures/Characters/Unlock/chernilka.png"),
		"name": "Чернилка",
		"rarity": "Special"
	},
	"lenin": {
		"texture": load("res://Textures/Characters/Unlock/lenin.png"),
		"name": "Ленин но играто",
		"rarity": "Special"
	},
	"hamster": {
		"texture": load("res://Textures/Characters/Unlock/hamster.png"),
		"name": "Xамстер",
		"rarity": "Unusual"
	},
	"sigma": {
		"texture": load("res://Textures/Characters/Unlock/sigma.png"),
		"name": "Сигма",
		"rarity": "Legendary"
	},
	"obnova": {
		"texture": load("res://Textures/Characters/Unlock/obnova.png"),
		"name": "Ребят, две недели не буду у компа",
		"rarity": "Special"
	},
	"chillguy": {
		"texture": load("res://Textures/Characters/Unlock/chillguy.png"),
		"name": "Чилловый парень",
		"rarity": "Legendary"
	},
	"clippy": {
		"texture": load("res://Textures/Characters/Unlock/clippy.png"),
		"name": "Клиппи",
		"rarity": "Unusual"
	},
	"amogus": {
		"texture": load("res://Textures/Characters/Unlock/amogus.png"),
		"name": "Амогус",
		"rarity": "Unusual"
	},
}

var rarity_textures = {
	"Default": "res://Textures/bg/bg_default.png",
	"Unusual": "res://Textures/bg/bg_unusual.png",
	"Legendary": "res://Textures/bg/bg_legendary.png",
	"Special": "res://Textures/bg/bg_special.png",
}

func unlock():
	if unlockchar in characters_data:
		ButtonClose.disabled = true
		var char_data = characters_data[unlockchar]
		var style_box = BG_RARITY.get_stylebox("panel") as StyleBoxTexture
		GlobalVars.Characters_Unlock[unlockchar] = true
		CharacterTexture.texture = char_data["texture"]
		Name.text = char_data["name"]
		rarity = char_data["rarity"]
		style_box.texture = load(rarity_textures[rarity])
		Animation.play("Unlock")


func _on_Settings_unlock(promocode_key):
	visible = true
	unlockchar = promocode_key
	unlock()


func _on_Close_pressed():
	visible = false


func _on_AnimUnlock_animation_finished(anim_name):
	if anim_name == "Unlock":
		ButtonClose.disabled = false

func _on_CharactersProfiles_unlockcharacter(character):
	visible = true
	unlockchar = character
	unlock()
