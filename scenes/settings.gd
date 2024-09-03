extends Control



func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)


func _on_mute_toggled(toggled_on):
	pass # Replace with function body.


func _on_resolutions_item_selected(index):
	match index:
			0:
				DisplayServer.window_set_size(Vector2i(1920,1080))
			1:
				DisplayServer.window_set_size(Vector2i(1600,900))
			2:
				DisplayServer.window_set_size(Vector2i(1280,720))





func _on_screen_mode_item_selected(index):
	match index:
		0: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Borderless Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		2: #Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		3: #Borderless Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
