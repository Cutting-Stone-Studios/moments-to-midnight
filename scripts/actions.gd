extends Node2D

@export var entity_clicked : Global.Characters

@onready var talk = $talk
@onready var interact = $interact
@onready var exit = $exit

var entity
# Called when the node enters the scene tree for the first time.
func _ready():

	talk.pressed.connect(_on_player_talk)
	interact.pressed.connect(_on_player_interact)
	exit.pressed.connect(_on_action_menu_exit)

func _on_player_talk():

	print(Global.PlayerState.Talk, entity_clicked)
	Signals.action_pressed.emit(Global.PlayerState.Talk, entity_clicked)
	Signals.entity_unfocused.emit()

func _on_player_interact():

	Signals.action_pressed.emit(Global.PlayerState.Interact, entity_clicked)
	Signals.entity_unfocused.emit()

func _on_action_menu_exit():

	Signals.entity_unfocused.emit()
	Signals.action_pressed.emit(Global.PlayerState.Neutral, null)
