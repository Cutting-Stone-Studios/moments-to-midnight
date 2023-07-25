extends Node2D

var current_scene = Global.GameState.Town_center
@export var buttons : Array[Button]

func _ready():
	
	for button in buttons:
		button.pressed.connect(_button_pressed)

func _button_pressed():
		

func _physics_process(delta):

	pass