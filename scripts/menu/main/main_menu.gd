extends Control

@onready var button = $Sign

var current_scene = Global.GameState.Title

func _ready():
	button.pressed.connect(_button_pressed)

func _button_pressed():
	Signals.path_selected.emit(Global.GameState.Map)

	
	
