extends Control

onready var soundbut = get_node("/root/Game/ButSound")

func _ready():
	pass

func _on_CTO_pressed():
	soundbut.play()
