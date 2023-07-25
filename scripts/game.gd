extends Node2D

## Create SceneManager instance
## First scene will always be the titlescreen
var scene_manager = SceneManager.new()
## Player state manager
var player_manager = PlayerManager.new()
## Dialogue system
var entity_manager = EntityManager.new()
## To hold our scene instance later
var scene_inst


@export var UI : CanvasLayer
@onready var animation = $AnimationPlayer
@onready var Sound = $AudioStreamPlayer
var song1 = preload("res://assets/sound/music/2.wav")
## @author: Brandon Xaltipa
## @date: 7/14/2023
## The idea here is that we'll have the "game" scene, which will have the current GameState scene 
## as a child at all times. It will always replace the last scene with the next one based on player input.
## When a scene is replaced, we call queue_free() on "scene_inst".

func _ready():

	## Connect to the signals from our Signals Singleton (say that 3 times really fast)
	Signals.path_selected.connect(_on_path_selected)
	Signals.action_pressed.connect(_on_player_action)

	## Create a new scene based on SceneManagers current_state property 
	make_new_scene()


func _on_path_selected(p):

	if p != Global.GameState.Title:
		Sound.set_stream(song1)
		Sound.play()


	if not true in [p == Global.GameState.Map, p == Global.GameState.Title]:
		UI.button.visible = true
	else:
		UI.button.visible = false

	update_game_state(p)

func _on_player_action(state, entity):

	player_manager.change_state(state, entity)

	if state == Global.PlayerState.Talk or state == Global.PlayerState.Talk_self:
		UI.can_show_dialog_box = true
		Global.can_interact_with_screen = false
	else:
		UI.can_show_dialog_box = false
			
	UI.text_manager.set_scene_dialogue(scene_manager.current_state,entity)

func update_game_state(scn):

	await do_fade_out()
	scene_inst.queue_free()	
	scene_manager.change_scene(scn)
	entity_manager.update(scene_manager.current_state)
	UI.end_day.visible = true

	make_new_scene()
	events()

func make_new_scene():

	var new_scene = Global.get_new_scene(scene_manager.current_state)
	scene_inst = new_scene.instantiate()
	add_child(scene_inst)

func do_fade_out():

	animation.play("dissolve")
	await animation.animation_finished
	animation.play_backwards("dissolve")

func events():

	if Global.day == 0 and scene_manager.current_state == Global.GameState.Map:
		if Global.player_self_events == 0:
			await get_tree().create_timer(1.0).timeout
			Signals.action_pressed.emit(Global.PlayerState.Talk_self, Global.Characters.Noone)
			Global.player_self_events += 1