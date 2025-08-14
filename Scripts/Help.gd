extends Control

var link_telegram = "https://t.me/memlicker"
var link_tiktok = "https://www.tiktok.com/@memlicker"
onready var versionlabel = $VersionCode

func _ready():
	versionlabel.text = "v 1.4(5)"

func _on_Telegram_pressed():
	OS.shell_open(link_telegram)


func _on_TikTok_pressed():
	OS.shell_open(link_tiktok)
