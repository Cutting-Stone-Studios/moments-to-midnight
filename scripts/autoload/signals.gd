extends Node2D

signal path_selected(path)
signal action_pressed(action, to)
signal start_dialogue(action, entity)

signal remove_dialogue
signal player_interact(action, entity)
signal character_hovered(character, mouse_pos)
signal entity_unfocused

signal answer(answer)