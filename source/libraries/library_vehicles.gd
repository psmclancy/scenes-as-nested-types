extends Node
class_name LibraryVehicles

var library_vehicle_dict: Dictionary[String,PrimeVehicle]
var library_vehicle_array: Array[PrimeVehicle]

func _ready():
	# Generate a dictionary and Array of all vehicles for referencing by another script
	# Dict is for easy access with human readable names, array is for sequential access
	# Dict is formatted as {node_name = node} and you can use `vehicle_dict["node_name"]` to access its properties
	for this_vehicle: PrimeVehicle in get_children():
		library_vehicle_dict[this_vehicle.name] = this_vehicle
		library_vehicle_array.append(this_vehicle)