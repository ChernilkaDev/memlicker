# Скрипт страниц персонажей

extends Control

var Page = 1
var select_page = "Default"

onready var TextPageNum = $PageNumber
onready var Rares = {
	"Default": $Default,
	"Legendary": $Legendary,
	"Specials": $Specials,
	"Unusual": $Unusual,
	"DF": $DF
}

onready var SoundBut = $ButSound

func _process(delta):
	TextPageNum.text = str(Page)

func show_node(node_name: String):
	for name in Rares.keys():
		Rares[name].hide()
	
	# Показываем только выбранную ноду
	if Rares.has(node_name):
		Rares[node_name].show()

func switch():
	if Page == 1:
		select_page = "Default"
	elif Page == 2:
		select_page = "Unusual"
	elif Page == 3:
		select_page = "Legendary"
	elif Page == 4:
		select_page = "Specials"
	elif Page == 5:
		select_page = "DF"
	
	
	show_node(select_page)

func _on_Left_pressed():
	SoundBut.play()
	Page -= 1
	if Page < 1:
		Page = 4
		switch()
	switch()


func _on_Right_pressed():
	SoundBut.play()
	Page += 1
	if Page > 4:
		Page = 1
		switch()
	switch()
