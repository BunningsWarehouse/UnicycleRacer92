extends VehicleBody3D
@onready var camera_origin = $CameraOrigin
@export var sens = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	steering = Input.get_axis(InputEventMouseMotion)
	if Input.is_action_just_pressed("menu"):
		get_tree().quit()

