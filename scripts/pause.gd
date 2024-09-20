extends Control

@onready var panel = get_node("Panel")

func _ready():
	panel.hide()
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	panel.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	panel.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func testEsc():
	if Input.is_action_just_pressed("menu") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("menu") and get_tree().paused:
		resume()

func _on_resume_pressed():
	resume()


func _on_exit_pressed():
	get_tree().quit()

func _process(delta):
	testEsc()
