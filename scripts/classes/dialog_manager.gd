extends Node2D

class_name DialogManager

var current_state = null 
var current_entity = null
var current_text = null

var can_show_dialog = false
var dialog_box = preload("res://scenes/UI/dialog box/dialog_box.tscn")
var db

var text_index
var text_speed
var display_text
var text_len = 1
var _delta = 0

func _init():

	db = dialog_box.instantiate()
	Signals.start_dialogue.connect(_on_do_dialog)

func _on_do_dialog():

	if current_state == Global.PlayerState.Talk:

		if text_index > text_speed * _delta:
			
			text_index = 0  	
			display_text = current_text.substr(0, text_len)
			text_len += 1

		text_index += 1

func update(delta, state, entity) -> void:

	_delta = delta

	if current_state != state:
		current_state = state

	if current_entity != entity:

		current_entity = entity
		current_text = FileManager.return_character_json(entity)
		print(current_text[str(Global.day)]["npc_dialogue"])