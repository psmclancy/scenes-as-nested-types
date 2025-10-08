extends Node

@export var debug_enabled: bool = true		

@export var library_vehicles: LibraryVehicles = null
var vehicle_dict: Dictionary[String,PrimeVehicle]
var vehicle_array: Array[PrimeVehicle]

var current_vehicle

func _ready():
	# Check to make sure vehicle library is assigned and grab its dictionary for easier referencing
	if library_vehicles != null:
		# Adds each vehicle to this menu's dict and array
		vehicle_dict = library_vehicles.library_vehicle_dict
		vehicle_array = library_vehicles.library_vehicle_array	
		debug_print("Populated Vehicle Library and Array")
	else:
		printerr("No library_vehicles defined in Vehicle Select Menu")

	# Initialize first "current vehicle"
	var initial_vehicle: String = "Vehicle_01"
	if vehicle_dict[initial_vehicle] != null:
		current_vehicle = vehicle_dict[initial_vehicle]
		debug_print("Current vehicle set as %s"%initial_vehicle)
	else:
		printerr("Vehicle Select Menu failed to initialize %s on vehicle_dict"%initial_vehicle)

func _process(_delta):
	ImGui.Begin("Vehicle Select")
	ImGui.SetWindowSize(Vector2(1920,1080))
	ImGui.SetWindowPos(Vector2(0,0))
	ImGui.Text("Current_Vehicle: %s"%current_vehicle.display_name)
	ImGui.Image(current_vehicle.icon, Vector2(300,170))
	if ImGui.Button("Next Vehicle"):
		select_vehicle(+1)
		debug_print("Next Vehicle Pressed")
	if ImGui.Button("Previous Vehicle"):
		select_vehicle(-1)
		debug_print("Previous Vehicle Pressed")
	ImGui.TextWrapped("\nFull Vehicle Library: %s"%vehicle_dict)
	ImGui.End()

func select_vehicle(next_or_previous): # next_or_previous is either +1 or -1 for next or previous vehicle
	var current_vehicle_index: int = vehicle_array.find(current_vehicle) 
	var next_vehicle = (current_vehicle_index + next_or_previous)%vehicle_array.size() 
	current_vehicle = vehicle_array[next_vehicle]

	debug_print(current_vehicle.display_name)

func debug_print(debug_string: String):
	if debug_enabled == true:
		print("%s"%debug_string)
