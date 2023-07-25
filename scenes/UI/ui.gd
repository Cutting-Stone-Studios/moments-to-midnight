extends CanvasLayer

@onready var button = $back_to_map
@onready var end_day = $end_day
var dialog_box = preload("res://scenes/UI/dialog box/dialog_box.tscn")
var action_menu = preload("res://scenes/UI/actions.tscn")

var text_manager = TextManager.new()

var can_show_dialog_box = false 
var menu_open = false
var dialogue_box_open = false

var mouse_pos
var m
var db
# Called when the node enters the scene tree for the first time.
func _ready():

	button.pressed.connect(_on_map_pressed)
	end_day.pressed.connect(_on_end_day)
	Signals.character_hovered.connect(_on_character_hovered)
	Signals.entity_unfocused.connect(_on_entity_unfocused)
	Signals.answer.connect(_on_answer)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)


func _on_end_day():
	Global.day += 1
	text_manager.update_day()
	Signals.action_pressed.emit(Global.PlayerState.Talk, Global.Characters.Noone)

	await get_tree().create_timer(1.0).timeout
func _on_map_pressed():

	Signals.action_pressed.emit(Global.PlayerState.Neutral, null)
	Signals.path_selected.emit(Global.GameState.Map)

func _on_dialogue_ended(r):
	db.greg.visible = true
	db.doug.visible = true
	db.sef.visible = true
	db.queue_free()
	Global.can_interact_with_screen = true

func _on_character_hovered(character, mouse_pos):
	spawn_action_menu(character, mouse_pos)

func _on_entity_unfocused():

	if menu_open:
		m.queue_free()
		menu_open = false

func spawn_action_menu(character, m_pos):

	mouse_pos = m_pos

	if not menu_open:

		m = action_menu.instantiate()
		m.position = m_pos
		m.entity_clicked = character
		add_child(m)
		menu_open = true

func spawn_dialog_box() -> void:

	if not dialogue_box_open:

		text_manager.get_current_text()
		db = dialog_box.instantiate()
		db.t = text_manager.text
		if len(text_manager.character) > 0:
			db.name_label.text = text_manager.character + ":"
			
		db.set_responses(text_manager.responses)
		add_child(db)
		match text_manager.character:
			"Greg":
				db.greg.visible = true
				db.doug.visible = true
			"Serafina":
				db.sef.visible = true
				db.doug.visible = true
			"Eustace":
				db.eus.visible = true
				db.doug.visible = true 

#		if db.sprites.has(text_manager.character):
#			db.sprite.set_texture(db.sprites[text_manager.character])
		dialogue_box_open = true


func _on_answer(id):

	if id == null:
		id = text_manager.current_conversation.next_id
		db.t = text_manager.text
		can_show_dialog_box = false
		dialogue_box_open = false
		Signals.action_pressed.emit(Global.PlayerState.Neutral, null)

	if len(db.t) > db.text_len:
		db.text_len = len(db.t)
		return
	text_manager.get_next_line(id)
	if len(text_manager.character ) > 0:
		db.name_label.text = text_manager.character + ":"
	db.t = text_manager.text
	db.reset_box()
	db.set_responses(text_manager.responses)

func _process(delta):

	if Global.can_interact_with_screen:
		if menu_open:
			m.position = mouse_pos

	if can_show_dialog_box:
		spawn_dialog_box()

	if Global.close_game:
		get_tree().quit()
