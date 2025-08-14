# Тоже самое что и прошлый скрипт загрузки

extends CanvasLayer

func _ready():
	var target_directory = "res://TexturePacks"
	var folders_with_pack_json = []

	if Directory.new().dir_exists(target_directory):
		# Рекурсивный поиск файлов pack.json
		folders_with_pack_json = find_pack_json_files(target_directory)

	if folders_with_pack_json.size() > 0:
		print("Найдены папки с pack.json: ")
		for folder in folders_with_pack_json:
			print("Папка: ", folder)
			# Чтение и вывод содержимого pack.json
			print_pack_json(folder + "/pack.json")
			# Проверка текстур в pack.json
			check_textures(folder + "/pack.json", folder)
	else:
		print("Файлы pack.json не найдены в директории: ", target_directory)


# Функция для рекурсивного поиска файлов pack.json
func find_pack_json_files(directory_path: String) -> Array:
	var dir = Directory.new()
	var folders_with_pack_json = []
	
	if dir.open(directory_path) == OK:
		dir.list_dir_begin(true, false)

		while true:
			var file_name = dir.get_next()
			if file_name == "":
				break
			
			var current_path = directory_path + "/" + file_name
			
			if dir.current_is_dir() and file_name != "." and file_name != "..":
				folders_with_pack_json += find_pack_json_files(current_path)
			elif dir.file_exists(current_path) and file_name == "pack.json":
				folders_with_pack_json.append(directory_path)
				print("Найден файл pack.json в: ", directory_path)

		dir.list_dir_end()
	
	return folders_with_pack_json


# Функция для чтения и вывода данных из pack.json
func print_pack_json(file_path: String) -> void:
	var file = File.new()
	if file.file_exists(file_path) and file.open(file_path, File.READ) == OK:
		var data = parse_json(file.get_as_text())
		file.close()
		
		if data.has("pack"):
			var pack_info = data["pack"]
			print(pack_info.get("name", "Не указано"))
			print(pack_info.get("description", "Не указано"))
			print(pack_info.get("autor", "Не указано"))
			print(pack_info.get("id", "Не указано"))
			print(pack_info.get("icon", "Не указано"))
			print(pack_info.get("bg_color", "Не указано"))
		else:
			print("Ошибка: в файле отсутствует ключ 'pack'")
	else:
		print("Ошибка открытия файла: ", file_path)


# Функция для проверки наличия текстур в директории пакета
func check_textures(file_path: String, pack_folder: String) -> void:
	var file = File.new()
	if file.file_exists(file_path) and file.open(file_path, File.READ) == OK:
		var data = parse_json(file.get_as_text())
		file.close()
		
		if data.has("textures"):
			var textures = data["textures"]
			for texture_name in textures.keys():
				# Построение полного пути к текстуре внутри папки пакета
				var texture_path = pack_folder + "/" + textures[texture_name]
				if !File.new().file_exists(texture_path):
					print("Текстура отсутствует: ", texture_name, " по пути: ", texture_path)
				else:
					print("Текстура найдена: ", texture_name, " по пути: ", texture_path)
		else:
			print("Ошибка: в файле отсутствует ключ 'textures'")
	else:
		print("Ошибка открытия файла: ", file_path)
