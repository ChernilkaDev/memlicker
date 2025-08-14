# Неиспользуемый скрипт мини-игры "Поймай объект"

extends Control

var touch_detected

onready var CharacterSprite = $Character
onready var texturescharacters = {
	"trollface": load("res://Textures/Characters/Unlock/trollface.png"),
	"doge": load("res://Textures/Characters/Unlock/doge.png"),
	"tabick": load("res://Textures/Characters/Unlock/tabick.png"),
	"chaika": load("res://Textures/Characters/Unlock/chaika.png"),
	"xapn": load("res://Textures/Characters/Unlock/xapn.png"),
	"pivo": load("res://Textures/Characters/Unlock/pivo.png"),
	"mops": load("res://Textures/Characters/Unlock/mops.png"),
	"sanic": load("res://Textures/Characters/Unlock/sanic.png"),
	"dogweno": load("res://Textures/Characters/Unlock/dogweno.png"),
	"chinda": load("res://Textures/Characters/Unlock/chinda.png"),
	"chernilka": load("res://Textures/Characters/Unlock/chernilka.png"),
	"lenin": load("res://Textures/Characters/Unlock/lenin.png"),
	"hamster": load("res://Textures/Characters/Unlock/hamster.png"),
	"sigma": load("res://Textures/Characters/Unlock/sigma.png"),
	"obnova": load("res://Textures/Characters/Unlock/obnova.png"),
	"chillguy": load("res://Textures/Characters/Unlock/chillguy.png"),
	"clippy": load("res://Textures/Characters/Unlock/clippy.png"),
	"amogus": load("res://Textures/Characters/Unlock/amogus.png"),
}

func _ready():
	spriteload()

func _physics_process(delta):
	pass

func spriteload():
	var selected_character_data = CharactersData.characters_data.get(GlobalVars.SelectedCharacter)
	if selected_character_data:
		# Устанавливаем текстуру из CharactersData в profile_nodes
		var texture = selected_character_data.get("texture")
		if texture:
			CharacterSprite.texture = texture

func _on_left_button_down():
	print("left down")


func _on_left_button_up():
	print("left up")


func _on_left_mouse_entered():
	touch_detected = true


func _on_left_mouse_exited():
	touch_detected = false
