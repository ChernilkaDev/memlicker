# Создание мемсферы было ужасным решением и я решил переделать код чтобы
# Это выглядело как ящики в бравл старсе, но имя скрипта я решил оставить старым

extends Control

onready var Anim = $AnimationPlayer
onready var CoinLabel = $Items/Coins_Item/CoinsLabel
onready var But = $Sphere/SphereCOLOR
onready var NumberText = $Items/ItemsNumber/Number
onready var panelitem = $Items/ItemsNumber/Panel
onready var Items_Node = $Items
onready var CoinsItem = $Items/Coins_Item
onready var UpgradeLabel = $Items/Upgrade/Label
onready var UpgradeTexture = $Items/Upgrade/TextureRect
onready var UpgradeNode = $Items/Upgrade
onready var nodeitemsnumber = $Items/ItemsNumber
onready var continue_but = $Button
onready var cardpackbut = $CardPack/part2

var nodemoney = true
var count_item
var quantity
var memcoingive
var upgrade_character_select
var valid_characters = []  # Инициализация пустого списка для хранения допустимых персонажей

var characters_card_textures = {
	"trollface": load("res://Textures/Characters/Cards/TrollfaceCard.png"),
	"doge": load("res://Textures/Characters/Cards/DogeCard.png"),
	"sanic": load("res://Textures/Characters/Cards/SanicCard.png"),
	"dogweno": load("res://Textures/Characters/Cards/DogwenoCard.png"),
	"hamster": load("res://Textures/Characters/Cards/HamsterCard.png"),
	"sigma": load("res://Textures/Characters/Cards/SigmaCard.png"),
	"chaika": load("res://Textures/Characters/Cards/ChaikaCard.png"),
	"obnova": load("res://Textures/Characters/Cards/ObnovaCard.png"),
	"chillguy": load("res://Textures/Characters/Cards/СhillGuyCard.png"),
	"clippy": load("res://Textures/Characters/Cards/ClippyCard.png"),
}

func math_give():
	pass

func _process(delta):
	NumberText.text = str(count_item)

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		upgrade_character()

func upgrade_character():
	# Обновляем список valid_characters, как и прежде
	valid_characters.clear()  # Очищаем список перед заполнением новыми значениями
	for character in GlobalVars.Characters_Unlock.keys():
		if GlobalVars.Characters_Unlock[character]:
			var level = int(GlobalVars.Characters_Upgrade[character])
			var cards = int(GlobalVars.Characters_Cards[character])  # Преобразуем строку в число

			# Логика для добавления персонажей в valid_characters
			if level == 3 or level == 6:
				continue
			if (level == 1 and cards < 5) or (level == 2 and cards < 7):
				valid_characters.append(character)
	# Проверяем, пустой ли список подходящих персонажей
	var valid_characters_count = valid_characters.size()
	if valid_characters_count == 0:
		count_item = 0
		print("Нет подходящих персонажей для улучшения.")
	else:
		# Если количество подходящих персонажей больше 5, сокращаем до 5 случайных элементов
		if valid_characters.size() > 5:
			valid_characters.shuffle()  # Перемешиваем список для случайного выбора
			valid_characters = valid_characters.slice(0, 4)  # Оставляем только первые 5 элементов
			valid_characters_count = valid_characters.size()  # Обновляем количество


		# Выводим результат
		print("Подходящие персонажи для улучшения:", valid_characters)
		print("Количество подходящих персонажей для прокачки:", valid_characters_count)
		count_item = valid_characters_count

	# Устанавливаем первый элемент из valid_characters в upgrade_character_select
	if valid_characters.size() > 0:
		upgrade_character_select = valid_characters[0]  # Берем первый элемент
		print("Персонаж для улучшения:", upgrade_character_select)
		addcards()
		# Устанавливаем текстуру карточки для выбранного персонажа
		if upgrade_character_select in characters_card_textures:
			UpgradeTexture.texture = characters_card_textures[upgrade_character_select]
	# Возвращаем результат в виде словаря
	return {
		"characters": valid_characters,
		"count": valid_characters_count
	}

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Open":
		Anim.play("Item1")
	if anim_name == "Item1":
		#print(anim_name, " end")
		continue_but.visible = true
		continue_but.disabled = false
	if anim_name == "Item2":
		continue_but.disabled = false
		nodemoney = false

func _on_Shop_buy_sphere():
	nodemoney = true
	UpgradeNode.visible = false
	cardpackbut.disabled = false
	visible = true
	continue_but.visible = false
	continue_but.disabled = true
	randomize()
	Items_Node.visible = false
	Anim.play("CardPackIdle")
	memcoingive = 50 + randi() % 20
	CoinLabel.text = "МЕМКОИНЫ\n" + str(memcoingive)
	GlobalVars.MemCoin += memcoingive

func _on_Button_pressed():
	#print("presseditem")
	if count_item > 0:
		count_item -= 1
		Anim.play("Item2")
		continue_but.disabled = true
		CoinsItem.visible = false
		UpgradeNode.visible = true
		
		if nodemoney == false:
			# Убираем первый элемент из valid_characters
			if valid_characters.size() > 0:
				valid_characters.remove(0)  # Удаляем первый элемент
				# Обновляем переменную upgrade_character_select
				if valid_characters.size() > 0:
					upgrade_character_select = valid_characters[0]  # Обновляем выбор персонажа
				else:
					upgrade_character_select = null  # Если список пуст, сбрасываем выбор
				# Обновляем текстуру для нового выбранного персонажа
				if upgrade_character_select and upgrade_character_select in characters_card_textures:
					UpgradeTexture.texture = characters_card_textures[upgrade_character_select]
				# Выводим актуальные данные
				
				print("Оставшиеся персонажи:", valid_characters)
				print("Текущий персонаж для улучшения:", upgrade_character_select)
				addcards()
				print(GlobalVars.Characters_Cards[upgrade_character_select])
	else:
		Items_Node.visible = false
		Anim.stop()
		hide()



func addcards():
	var current_cards = int(GlobalVars.Characters_Cards[upgrade_character_select])
	GlobalVars.Characters_Cards[upgrade_character_select] = str(current_cards + 1)
	print("Персонаж: ", upgrade_character_select ,  " Карточки: " , GlobalVars.Characters_Cards[upgrade_character_select])

func _on_2_pressed():
	But.disabled = true
	cardpackbut.disabled = true
	Anim.stop()
	Anim.play("Open")
	upgrade_character()
