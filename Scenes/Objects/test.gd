# Скрипт текстур паков №1

extends Node

var path_to_game := "user://Memlicker"
var path_to_packs := "user://Memlicker/TexturePacks"
onready var text1 = $name
onready var text2 = $name2

func _ready():
	var dir = Directory.new()
	if dir.open(path_to_game) != OK:
		text1.text = OS.get_data_dir()
		print(dir.get_current_dir())
		print(OS.get_data_dir())
	else:
		text1.text = OS.get_data_dir()
		print(dir.get_current_dir())
		print(OS.get_data_dir())
	
	if dir.open(path_to_packs) != OK:
		text2.text = OS.get_data_dir()
		print(dir.get_current_dir())
		print(OS.get_data_dir())
	else:
		text2.text = OS.get_data_dir()
		print(dir.get_current_dir())
		print(OS.get_data_dir())
