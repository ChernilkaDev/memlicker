signal Load_end # Загрузка данных камон

extends Control

var load_status
onready var LabelError = $Dialog/Label
onready var popupdialog = $Dialog
onready var TimerLoad = $Timer


func _ready():
	pass
	TimerLoad.start()

func _process(delta):
	GlobalVars.load_game()
	load_status = GlobalVars.data_loaded

func _on_Timer_timeout():
	TimerLoad.stop()
	if load_status and !GlobalVars.beginner:
		print("Good")
		emit_signal("Load_end")
		visible = false
	else:
		print("notgood")
		LabelError.text = "Ошибка загрузки данных игры.\nВозможно, файл сохранения был повреждён.\nСвяжитесь с разработчиком\nКод ошибки: " + str(GlobalVars.errorcode)
		popupdialog.visible = true


func _on_Button_pressed():
	emit_signal("Load_end")
	visible = false

