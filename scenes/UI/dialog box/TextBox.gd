extends Control


@export var text_box : RichTextLabel
@export var text_speed : int = 700
@export var buttons : HBoxContainer
@export var name_label : Label
@onready var doug = $Doug
@onready var greg = $Greg
@onready var sef = $Sef
@onready var eus = $Eustace
var sprites = {
	"Greg" : preload("res://assets/Character Sprites/Large/Greg.png"),
	"Doug" : preload("res://assets/Character Sprites/Large/Doug.png")
}
var text_index = 0
var t = "askjdnakjsdjkasd"
var responses 
var text_len = 1

func reset_box():

	text_index = 0
	text_len = 1

	for i in buttons.get_children():
		buttons.remove_child(i)
		i.queue_free()

func set_responses(res):

	if res.size() > 0:
		for r in res:
			var b = Button.new()
			b.text = r.text
			buttons.add_child(b)
			b.pressed.connect(_on_answer.bind(r.next_id))
	else:
		var b = Button.new()
		b.text = "Continue.."
		buttons.add_child(b)
		b.pressed.connect(_on_answer.bind(null))
		
func _process(delta):

	if text_index > text_speed * delta:

		text_index = 0  	
		text_box.text = t.substr(0, text_len)
		text_len += 1

	text_index += 1

func _on_answer(name):

	Signals.answer.emit(name)