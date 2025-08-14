# Вы сильно не ахуевайте от этого говнокода ибо я сам хз

extends CanvasLayer

var Select_Scene = "Menu"
onready var profile_nodes = {
	"node": $CharactersProfiles/Profile,
	"infotexture": $CharactersProfiles/Profile/Info,
	"equipbut": $CharactersProfiles/Profile/EquipBut,
}

onready var animsecret = $secret/AnimationPlayer
onready var coin_label = $UI/Coins/Label
onready var gems_label = $UI/Gems/Label
onready var Characters = $Characters
onready var Shop = $Shop
onready var Menu = $UI
onready var Skins = $Skins
onready var Settings = $Settings
onready var SoundBut = $ButSound
onready var MusicBG = $BgMusic
onready var CharactersProfile = $CharactersProfiles
onready var HelpScreen = $Help

onready var Nodes = {
	"Menu": $UI,
	"Shop": $Shop,
	"Settings": $Settings,
	"Characters": $Characters,
	"CharactersProfile": $CharactersProfiles,
	"Skins": $Skins,
	"HelpScreen": $Help,
	"Minigames": $Minigames
}

var SelectChar
onready var ClickButton = $UI/ClickButton

func _ready():
	SelectChar = GlobalVars.SelectedCharacter
	
	var selected_character_data = CharactersData.characters_data.get(SelectChar)
	if selected_character_data:
		# Устанавливаем текстуру из CharactersData в profile_nodes
		var clickskin = selected_character_data.get("clickskin")
		if clickskin:
			ClickButton.texture_normal = clickskin

	coin_label.text = str(GlobalVars.MemCoin)

func _on_ClickButton_pressed():
	var upgrade_value = GlobalVars.get_selected_character_upgrade()
	
	if upgrade_value:
		var upgrade_value_int = int(upgrade_value)
		GlobalVars.MemCoin += upgrade_value_int
		#print("Selected character upgrade value: " + str(upgrade_value_int))
	else:
		print(upgrade_value)
		#print("Selected character not found in Characters_Upgrade")


func _on_MemCharBut_pressed():
	SoundBut.play()
	Select_Scene = "Characters"
	show_node(Select_Scene)
	print(GlobalVars.character_profile)

func _process(delta):
	#print(GlobalVars.character_profile)
	GlobalVars.save_game()
	gems_label.text = str(GlobalVars.GemCoin)
	coin_label.text = str(GlobalVars.MemCoin)
	
	if GlobalVars.Characters_Unlock[SelectChar]:
		profile_nodes["equipbut"].disabled = false
	else:
		profile_nodes["equipbut"].disabled = true
	
	if GlobalVars.MusicStatus == false:
		MusicBG.stream_paused = true
	else:
		MusicBG.stream_paused = false

	if GlobalVars.SoundStatus == false:
		SoundBut.stream_paused = true
	else:
		SoundBut.stream_paused = false

func select_character(character):
	print(character)
	SoundBut.play()
	GlobalVars.character_profile = SelectChar
	profile_nodes["node"].visible = true
	
	# Получаем данные о выбранном персонаже из CharactersData
	var selected_character_data = CharactersData.characters_data.get(SelectChar)
	if selected_character_data:
		# Устанавливаем текстуру из CharactersData в profile_nodes
		var infotexture = selected_character_data.get("profiletexture")
		if infotexture:
			profile_nodes["infotexture"].texture = infotexture
	
	CharactersProfile.visible = true
	Characters.visible = false


func equip_character(character):
	var selected_character_data = CharactersData.characters_data.get(SelectChar)
	if selected_character_data:
		# Устанавливаем текстуру из CharactersData в profile_nodes
		var clickskin = selected_character_data.get("clickskin")
		if clickskin:
			ClickButton.texture_normal = clickskin
	
	print(character)
	GlobalVars.SelectedCharacter = SelectChar
	CharactersProfile.visible = false
	Characters.visible = false
	Menu.visible = true

func _on_ShopBut_pressed():
	SoundBut.play()
	Select_Scene = "Shop"
	show_node(Select_Scene)

func _on_SettingsBut_pressed():
	SoundBut.play()
	Select_Scene = "Settings"
	show_node(Select_Scene)

func _on_BackBut_pressed():
	SoundBut.play()
	Select_Scene = "Menu"
	show_node(Select_Scene)

func _on_TrollfaceCard_pressed():
	SelectChar = "trollface"
	select_character(SelectChar)

func _on_DogeCard_pressed():
	SelectChar = "doge"
	select_character(SelectChar)

func _on_TabickCard_pressed():
	SelectChar = "tabick"
	select_character(SelectChar)

func _on_ChaikaCard_pressed():
	SelectChar = "chaika"
	select_character(SelectChar)

func _on_HarpCard_pressed():
	SelectChar = "xapn"
	select_character(SelectChar)

func _on_PivoCard_pressed():
	SelectChar = "pivo"
	select_character(SelectChar)

func _on_MopsCard_pressed():
	SelectChar = "mops"
	select_character(SelectChar)

func _on_SanicCard_pressed():
	SelectChar = "sanic"
	select_character(SelectChar)

func _on_DogWenoCard_pressed():
	SelectChar = "dogweno"
	select_character(SelectChar)

func _on_ChindaCard_pressed():
	SelectChar = "chinda"
	select_character(SelectChar)

func _on_ChernilkaCard_pressed():
	SelectChar = "chernilka"
	select_character(SelectChar)

func _on_LeninCard_pressed():
	SelectChar = "lenin"
	select_character(SelectChar)

func _on_HamsterCard_pressed():
	SelectChar = "hamster"
	select_character(SelectChar)

func _on_SigmaCard_pressed():
	SelectChar = "sigma"
	select_character(SelectChar)

func _on_ObnovaCard_pressed():
	SelectChar = "obnova"
	select_character(SelectChar)

func _on_ChillGuyCard_pressed():
	SelectChar = "chillguy"
	select_character(SelectChar)

func _on_ClippyCard_pressed():
	SelectChar = "clippy"
	select_character(SelectChar)

func _on_AmogusCard_pressed():
	SelectChar = "amogus"
	select_character(SelectChar)

func _on_BackCharactersButT_pressed():
	SoundBut.play()
	profile_nodes["node"].visible = true
	#Profiles[SelectChar].visible = false
	CharactersProfile.visible = false
	Characters.visible = true

func _on_EquipBut_pressed():
	equip_character(SelectChar)

func _on_EquipButD_pressed():
	equip_character(SelectChar)

func _on_EquipButT_pressed():
	equip_character(SelectChar)

func _on_EquipButChaika_pressed():
	equip_character(SelectChar)

func _on_EquipButHarp_pressed():
	equip_character(SelectChar)

func _on_EquipButPivo_pressed():
	equip_character(SelectChar)

func _on_EquipButMops_pressed():
	equip_character(SelectChar)

func _on_EquipButDogWeno_pressed():
	equip_character(SelectChar)

func _on_EquipButChinda_pressed():
	equip_character(SelectChar)

func _on_EquipButChernilka_pressed():
	equip_character(SelectChar)

func _on_EquipButLenin_pressed():
	equip_character(SelectChar)

func _on_EquipButHamster_pressed():
	equip_character(SelectChar)

func _on_EquipButSanic_pressed():
	equip_character(SelectChar)

func _on_EquipButSigma_pressed():
	equip_character(SelectChar)

func _on_EquipButObnova_pressed():
	equip_character(SelectChar)

func _on_EquipButChill_pressed():
	equip_character(SelectChar)


func _on_EquipButClippy_pressed():
	equip_character(SelectChar)

func _on_EquipButAmogus_pressed():
	equip_character(SelectChar)

func _on_Info_pressed():
	SoundBut.play()
	Menu.visible = false
	HelpScreen.visible = true

func _on_Back_pressed():
	SoundBut.play()
	Menu.visible = true
	HelpScreen.visible = false

func _on_Agree_pressed():
	SoundBut.play()

func _on_savequit_pressed():
	GlobalVars.save_game()
	get_tree().quit()

func _on_SkinPacks_pressed():
	SoundBut.play()
	Settings.visible = false
	Skins.visible = true


func _on_BackButSkins_pressed():
	SoundBut.play()
	Settings.visible = true
	Skins.visible = false

func show_node(node_name: String):
	for name in Nodes.keys():
		Nodes[name].hide()
	
	# Показываем только выбранную ноду
	if Nodes.has(node_name):
		Nodes[node_name].show()


func _on_FakeLoadScreen_ended():
	if GlobalVars.MusicStatus == false:
		MusicBG.stream_paused = true
	else:
		MusicBG.stream_paused = false
		MusicBG.play()

	if GlobalVars.SoundStatus == false:
		SoundBut.stream_paused = true
	else:
		SoundBut.stream_paused = false


func _on_Music_toggled(button_pressed):
	if button_pressed == true:
		MusicBG.stream_paused = false
		MusicBG.play()
	else:
		print(button_pressed)

func _on_MiniGamesBut_pressed():
	SoundBut.play()
	Select_Scene = "Minigames"
	show_node(Select_Scene)
