extends Control

@onready var panel = get_node("Panel")
@onready var waypoints = get_node("../Waypoints")
# Called when the node enters the scene tree for the first time.
func _ready():
	panel.hide()
	$AnimationPlayer.play("RESET")

func winner():
	if waypoints.laps == 3:
		pause()

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	panel.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
