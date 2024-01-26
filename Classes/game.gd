extends Node

## Class which contains the logic and data required to run a game.
## Does not contain any rendering functions or input processing.
class_name Game

## Contains the game's data. Saving the board to disk allows
## saving and loading games.
var board: Board = Board.new()

## Notifies other nodes when a set of terrain tiles is changed
signal terrain_updated(changed: Array[Vector2i], terrain: Board.Terrain)


# Called when the node enters the scene tree for the first time.
func _ready():
	board = Board.new()
	# Creates a new board of size 50 x 50
	var width = 50
	var height = 50
	board.setup(width, height)
