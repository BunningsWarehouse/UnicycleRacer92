extends Node3D

var waypoints_reached: int = 0
var total_waypoints: int = 3
var waypoints_touched: Dictionary = {"Waypoint1": false, "Waypoint2": false, "Waypoint3": false}
var laps = 0

# Call	ed when the node enters the scene tree for the first time.
func _ready():
	for waypoint in get_children():
		if waypoint is Area3D:
			waypoint.body_entered.connect(_on_waypoint_entered.bind(waypoint))


# Called every frame. 'delta' is the elapsed time since the previous frame.




func _on_waypoint_entered(body: Node, waypoint: Area3D) -> void:
	if body.is_in_group("player"):
		if waypoint.name in waypoints_touched.keys():
			waypoints_touched[waypoint.name] = true
			waypoints_reached += 1
			print("touched Waypoint: " + waypoint.name)

		if waypoint.name == "Waypoint4":
			if waypoints_touched["Waypoint1"] and waypoints_touched["Waypoint2"] and waypoints_touched["Waypoint3"]:
				laps += 1
				print("Lap completed successfully " + str(laps))
				reset_waypoints()
				
			else:
				print("Lap not finished")

func reset_waypoints() -> void:
	for key in waypoints_touched.keys():
		waypoints_touched[key] = false
	waypoints_reached = 0
