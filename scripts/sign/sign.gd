extends Control

var current_scene = Global.GameState.Map

@export var buttons : Array[Button]
@onready var greg_talk = $greg_talk
@onready var sef_talk = $sef_talk
@onready var eus_talk = $eus_talk

func _ready():

	greg_talk.pressed.connect(_greg_talk)
	sef_talk.pressed.connect(_sef_talk)
	eus_talk.pressed.connect(_eus_talk)
#	for button in buttons:
#		button.pressed.connect(_button_pressed.bind(button.name))


func _greg_talk():

	Signals.action_pressed.emit(Global.PlayerState.Talk, Global.Characters.Greg)
	Signals.entity_unfocused.emit()

func _eus_talk():

	Signals.action_pressed.emit(Global.PlayerState.Talk, Global.Characters.Eustace)
	Signals.entity_unfocused.emit()

func _sef_talk():

	Signals.action_pressed.emit(Global.PlayerState.Talk, Global.Characters.Sera)
	Signals.entity_unfocused.emit()


#	Signals.path_selected.emit(Global.GameState[b])

func _process(delta):

	for b in buttons:
		b.disabled = not Global.can_interact_with_screen