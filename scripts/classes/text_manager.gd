extends Node2D
class_name TextManager

var current_conversation
var responses
var current_dialogue
var text
var next_id
var character

var day_1 = FileManager.day_1
var day_2
var day_3
var day_4
var day_5
var day_6
var day_7
var current_day
var keys
var days = [FileManager.day_1, FileManager.day_2]

func set_scene_dialogue(state, entity):
	
	if entity != null:

		var	name = Global.CharacterNames[entity]
		current_day = days[Global.day]
		var day_dialogue = current_day["dialogue"][state]
		current_dialogue = load(current_day[name])
		current_conversation = await current_dialogue.get_next_dialogue_line(day_dialogue)


func get_current_text():

	text = current_conversation.text
	responses = current_conversation.responses
	character = current_conversation.character
#	current_conversation = await current_dialogue.get_next_dialogue_line(current_conversation.next_id)

func get_next_line(next_id) -> void:

	current_conversation = await current_dialogue.get_next_dialogue_line(next_id)	
	if current_conversation != null:
		get_current_text()
	else:
		DialogueManager.dialogue_ended.emit(null)

func update_day():

	current_day = days[Global.day]

