# Глобальный скрипт который отвечает за сохранение данных игры и их загрузку

extends Node


var Config := ConfigFile.new()
var path_to_save := "user://GameData.cfg"
var section_name := "game"

var MemCoin = 0
var GemCoin = 0

var MusicStatus = true
var SoundStatus = true
var used_promocodes_list
var data_loaded = true
var errorcode
var beginner
var character_profile = ""
var skipfakeload : bool = true

var Characters_Unlock = { # Тут данные разблокированы ли персонажи
	"trollface": false,
	"doge": true,
	"tabick": false,
	"chaika": false,
	"xapn": false,
	"pivo": false,
	"mops": false,
	"sanic": false,
	"dogweno": false,
	"chinda": false,
	"chernilka": false,
	"lenin": false,
	"hamster": false,
	"sigma": false,
	"obnova": false,
	"chillguy": false,
	"clippy": false,
	"amogus": false,
}

var Characters_Upgrade = { #уровни персонажей: персонажи с 6 уровнем это особенные, иx нельзя трогать
	"trollface": "1",
	"doge": "1",
	"tabick": "6",
	"chaika": "1",
	"xapn": "6",
	"pivo": "6",
	"mops": "6",
	"sanic": "1",
	"dogweno": "1",
	"chinda": "6",
	"chernilka": "6",
	"lenin": "6",
	"hamster": "1",
	"sigma": "1",
	"obnova": "6",
	"chillguy": "1",
	"clippy": "1",
	"amogus": "1",
}

var Characters_Cards = { #количество карточек у персонажей, у особенныx иx 7
	"trollface": "0",
	"doge": "0",
	"tabick": "0",
	"chaika": "0",
	"xapn": "0",
	"pivo": "0",
	"mops": "0",
	"sanic": "0",
	"dogweno": "0",
	"chinda": "0",
	"chernilka": "0",
	"lenin": "0",
	"hamster": "0",
	"sigma": "0",
	"obnova": "0",
	"chillguy": "0",
	"clippy": "0",
	"amogus": "0",
}

var SelectedCharacter = "doge"

func get_selected_character_upgrade():
	if SelectedCharacter in Characters_Upgrade:
		print(Characters_Upgrade[SelectedCharacter])
		return Characters_Upgrade[SelectedCharacter]
	else:
		return null

func _process(delta):
	save_game()

func _ready():
	load_game()

func save_game():
	Config.set_value(section_name, "Mem_Coin", MemCoin)
	Config.set_value(section_name, "Gem_Coin", GemCoin)
	Config.set_value(section_name, "CharactersUnlock", Characters_Unlock)
	Config.set_value(section_name, "CharactersCards", Characters_Cards)
	Config.set_value(section_name, "SelectedChar", SelectedCharacter)
	Config.set_value(section_name, "Music", MusicStatus)
	Config.set_value(section_name, "Sound", SoundStatus)
	Config.set_value(section_name, "Upgrade", Characters_Upgrade)
	Config.set_value(section_name, "UsedPromo", used_promocodes_list)
	Config.set_value(section_name, "Beginner_data", beginner)
	Config.set_value(section_name, "Skipload", skipfakeload)
	var err = Config.save(path_to_save)
	if err != OK:
		print("Ошибка сохранения данных игры: ", err)

func load_game() -> void: # Тут уже комментарии чата гопота
	var err = Config.load(path_to_save)
	if beginner:
		print("begindata")
		beginner = false
		save_game()
	if err != OK:
		print("Ошибка загрузки данных игры: ", err, "\nВозможно, файл сохранения был повреждён.\nНачало новой игры...")
		errorcode = err
		data_loaded = false
	else:
		
		MemCoin = Config.get_value(section_name, "Mem_Coin", MemCoin)
		GemCoin = Config.get_value(section_name, "Gem_Coin", GemCoin)
		# Загружаем разблокированные персонажи и объединяем с текущими значениями
		var loaded_characters_unlock = Config.get_value(section_name, "CharactersUnlock", {})
		for key in Characters_Unlock.keys():
			if key in loaded_characters_unlock:
				Characters_Unlock[key] = loaded_characters_unlock[key]
	
		# Загружаем улучшения персонажей и объединяем с текущими значениями
		var loaded_characters_upgrade = Config.get_value(section_name, "Upgrade", {})
		for key in Characters_Upgrade.keys():
			if key in loaded_characters_upgrade:
				Characters_Upgrade[key] = loaded_characters_upgrade[key]
	
		var loaded_characters_cards = Config.get_value(section_name, "CharactersCards", {})
		for key in Characters_Cards.keys():
			if key in loaded_characters_cards:
				Characters_Cards[key] = loaded_characters_cards[key]
	
		SelectedCharacter = Config.get_value(section_name, "SelectedChar", SelectedCharacter)
		MusicStatus = Config.get_value(section_name, "Music", MusicStatus)
		SoundStatus = Config.get_value(section_name, "Sound", SoundStatus)
		skipfakeload = bool(Config.get_value(section_name, "Skipload", skipfakeload))
		beginner = Config.get_value(section_name, "Beginner_data", false)  # Provide a default value here

		# Указываем пустой массив в качестве значения по умолчанию для used_promocodes_list
		used_promocodes_list = Config.get_value(section_name, "UsedPromo", [])
		


