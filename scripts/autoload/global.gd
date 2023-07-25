extends Node2D

var day = 0
var karma = 0
var close_game = false
enum Characters {
	Doug,
	Greg,
	Noone,
	Sera,
	Eustace
}

const CharacterTypes = {
	"Doug" : Characters.Doug,
	"Greg" : Characters.Greg,
	"Noone" : Characters.Noone,
	"Seraphina" : Characters.Sera,
	"Eustace" : Characters.Eustace
}
const CharacterNames = {
	Characters.Doug : "Doug",
	Characters.Greg : "Greg",
	Characters.Noone : "Noone",
	Characters.Sera : "Seraphina",
	Characters.Eustace : "Eustace"
}

enum PlayerState {
	Neutral,
	Talk,
	Talk_self,
	Interact,
	Move,
	Hovered
}

# Game State
# This, as well as SceneManager, will keep track of the current scene/player "location"
enum GameState {
	Title,
	Map,
	Home_town,
	Pearly_gates,
	Behind_tower,
	Town_center,
	Lakeside
}

const GameScenes = {
	GameState.Title  : preload("res://scenes/UI/main menu/main_menu.tscn"),
	GameState.Map	 : preload("res://scenes/sign.tscn"),
	GameState.Home_town : preload("res://scenes/paths/Home_town.tscn"),
	GameState.Pearly_gates : preload("res://scenes/paths/path_2.tscn"),
	GameState.Behind_tower : preload("res://scenes/paths/path_3.tscn"),
	GameState.Town_center : preload("res://scenes/paths/town_center.tscn"),
	GameState.Lakeside : preload("res://scenes/paths/path_3.tscn")
}

var is_npc = ["Greg", "Greg", "Sef", "Eustace", "Greg", "Newspaper Boy", "Food Truck Dude", "Crush", "Old Couple", "Boss", "Dogy"]
var can_interact_with_screen = true
var player_self_events = 0
func get_new_scene(scn):
	return GameScenes[scn]

