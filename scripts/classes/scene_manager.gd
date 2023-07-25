class_name SceneManager

var current_state = Global.GameState.Title
var last_scene = null 
	
func change_scene(new_scene):
	
	if current_state != Global.GameState.Title:
		last_scene = current_state
	else:
		last_scene = Global.GameState.Map
		new_scene = Global.GameState.Map

	current_state = new_scene


		