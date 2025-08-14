# Итак, здесь находятся все данные персонажей

extends Node

var characters_data = {
	"chaika": {
		"texture": load("res://Textures/Characters/Unlock/chaika.png"), # Текстура
		"name": "Чайка", # Имя
		"rarity": "Legendary", # Редкость
		"clickskin": load("res://Textures/ClickSkins/ButtonClickChaika.png"), # Текстура скина для кнопки
		"cardicon": load("res://Textures/Characters/Cards/ChaikaCard.png"), # Карточка
		"profiletexture": load("res://Textures/Characters/Profiles/ChaikaProfileCard.png") # Текстура профиля
	},
	"trollface": {
		"texture": load("res://Textures/Characters/Unlock/trollface.png"),
		"name": "Троллфейс",
		"rarity": "Legendary",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickTrollface.png"),
		"cardicon": load("res://Textures/Characters/Cards/TrollfaceCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/TrollfaceProfileCard.png")
	},
	"doge": {
		"texture": load("res://Textures/Characters/Unlock/doge.png"),
		"name": "Доге",
		"rarity": "Default",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickDoge.png"),
		"cardicon": load("res://Textures/Characters/Cards/DogeCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/DogeProfileCard.png")
	},
	"tabick": {
		"texture": load("res://Textures/Characters/Unlock/tabick.png"),
		"name": "Табик",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickTabick.png"),
		"cardicon": load("res://Textures/Characters/Cards/TabickCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/TabickProfileCard.png")
	},
	"xapn": {
		"texture": load("res://Textures/Characters/Unlock/xapn.png"),
		"name": "Харп",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickHarp.png"),
		"cardicon": load("res://Textures/Characters/Cards/HarpCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/HarpProfileCard.png")
	},
	"pivo": {
		"texture": load("res://Textures/Characters/Unlock/pivo.png"),
		"name": "Бочка с пивом",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickPivo.png"),
		"cardicon": load("res://Textures/Characters/Cards/PivoCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/PivoProfileCard.png")
	},
	"mops": {
		"texture": load("res://Textures/Characters/Unlock/mops.png"),
		"name": "Мопс",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickMops.png"),
		"cardicon": load("res://Textures/Characters/Cards/MopsCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/MopsProfileCard.png")
	},
	"sanic": {
		"texture": load("res://Textures/Characters/Unlock/sanic.png"),
		"name": "Саник",
		"rarity": "Default",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickSanic.png"),
		"cardicon": load("res://Textures/Characters/Cards/SanicCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/SanicProfileCard.png")
	},
	"dogweno": {
		"texture": load("res://Textures/Characters/Unlock/dogweno.png"),
		"name": "Собака",
		"rarity": "Unusual",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickDogWeno.png"),
		"cardicon": load("res://Textures/Characters/Cards/DogWenoCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/DogWenoProfileCard.png")
	},
	"chinda": {
		"texture": load("res://Textures/Characters/Unlock/chinda.png"),
		"name": "Чичинда",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickChinda.png"),
		"cardicon": load("res://Textures/Characters/Cards/ChindaCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/ChindaProfileCard.png")
	},
	"chernilka": {
		"texture": load("res://Textures/Characters/Unlock/chernilka.png"),
		"name": "Чернилка",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickChernilka.png"),
		"cardicon": load("res://Textures/Characters/Cards/ChernilkaCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/ChernilkaProfileCard.png")
	},
	"lenin": {
		"texture": load("res://Textures/Characters/Unlock/lenin.png"),
		"name": "Ленин но играто",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickLenin.png"),
		"cardicon": load("res://Textures/Characters/Cards/LeninCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/LeninProfileCard.png")
	},
	"hamster": {
		"texture": load("res://Textures/Characters/Unlock/hamster.png"),
		"name": "Xамстер",
		"rarity": "Unusual",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickHamster.png"),
		"cardicon": load("res://Textures/Characters/Cards/HamsterCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/HamsterProfileCard.png")
	},
	"sigma": {
		"texture": load("res://Textures/Characters/Unlock/sigma.png"),
		"name": "Сигма",
		"rarity": "Legendary",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickSigma.png"),
		"cardicon": load("res://Textures/Characters/Cards/SigmaCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/SigmaProfileCard.png")
	},
	"obnova": {
		"texture": load("res://Textures/Characters/Unlock/obnova.png"),
		"name": "Ребят, две недели не буду у компа",
		"rarity": "Special",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickObnova.png"),
		"cardicon": load("res://Textures/Characters/Cards/ObnovaCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/ObnovaProfileCard.png")
	},
	"chillguy": {
		"texture": load("res://Textures/Characters/Unlock/chillguy.png"),
		"name": "Чилловый парень",
		"rarity": "Legendary",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickChillGuy.png"),
		"cardicon": load("res://Textures/Characters/Cards/СhillGuyCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/ChillGuyProfileCard.png")
	},
	"clippy": {
		"texture": load("res://Textures/Characters/Unlock/clippy.png"),
		"name": "Клиппи",
		"rarity": "Unusual",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickClippy.png"),
		"cardicon": load("res://Textures/Characters/Cards/ClippyCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/ClippyProfileCard.png")
	},
	"amogus": {
		"texture": load("res://Textures/Characters/Unlock/amogus.png"),
		"name": "Амогус",
		"rarity": "Unusual",
		"clickskin": load("res://Textures/ClickSkins/ButtonClickAmogus.png"),
		"cardicon": load("res://Textures/Characters/Cards/AmogusCard.png"),
		"profiletexture": load("res://Textures/Characters/Profiles/AmogusProfileCard.png")
	},
}
