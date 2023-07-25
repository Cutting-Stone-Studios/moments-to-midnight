extends Node2D

var root = "res://assets/dialogue/%s"

var DialogueFiles = {
	Global.Characters.Doug : [root % "doug/doug1.dialogue",
	root % "Greg2.dialogue"],
	Global.Characters.Greg : [root % "Greg1.dialogue",
	root % "Greg2.dialogue"]
}


var day_1 = {
		
	"dialogue" : {
		Global.GameState.Map : "doug_day1_map",
		Global.GameState.Town_center : "greg_day1"
	},
	"Noone" : root % "noone/opening.dialogue",
	"Doug" : root % "doug/doug1.dialogue",
	"Seraphina" : root % "sera/day1.dialogue",
	"Eustace" : root % "eustace/day1.dialogue",
	"Greg" : root % "greg/day1.dialogue",
	"Dog" : root % "Dog1.dialogue" 

}

var day_2 = {
	
	"dialogue" : {
		Global.GameState.Map : "closing"
	},
	
	"Noone" : root % "noone/closing.dialogue"

}





