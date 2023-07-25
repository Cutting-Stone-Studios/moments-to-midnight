extends Node2D
class_name Entity

var entity_name
var interaction_points
var is_present
var current_dialog
var resource
var day_str = str(Global.day)

func _init(dialog) -> void:

	resource = load(dialog[Global.day])
	self.start_text()
	
func start_text() -> void:

	current_dialog = await DialogueManager.get_next_dialogue_line(resource, "greg_day2")
																	