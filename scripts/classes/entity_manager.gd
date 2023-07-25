extends Node2D
class_name EntityManager

var entities = []
var focused_entity = null
var entity_states = null


func update(state):
	pass
	# if state == Global.PlayerState.Talk:
	# 	set_focused_entity(state, entity)
	# else:
	# 	exit_focused_entity(state,entity)

	# if focused_entity != null:
	# 	pass


func set_focused_entity(state, entity):

	if focused_entity != entity:
		focused_entity = entity

func exit_focused_entity(state, entity):

	focused_entity = null

