extends Node2D

@onready var Greg = $Greg
var mouse_pos 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	Greg.pressed.connect(_on_press)

func _on_press():

	mouse_pos = get_viewport().get_mouse_position()
	Signals.character_hovered.emit(Global.Characters.Greg, mouse_pos)
	Signals.action_pressed.emit(Global.PlayerState.Hovered, null)

