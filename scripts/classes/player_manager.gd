class_name PlayerManager

var current_state = Global.PlayerState.Neutral
var last_state = null
var current_entity = null
	
func change_state(new_state, entity=null) -> void:

	if new_state != current_state:
		last_state = current_state
		current_state = new_state





