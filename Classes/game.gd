extends Node

## Class which contains the logic and data required to run a game.
## Does not contain any rendering functions or input processing.
class_name Game

## Contains the game's data. Saving the board to disk allows
## saving and loading games.
var board: Board = Board.new()

## Notifies other nodes when a set of terrain tiles is changed.
signal terrain_updated(changed: Array[Vector2i], terrain: Board.Terrain)
## Emitted when a troop is placed.
signal troop_placed(troop: Troop, pos: Vector2i)

# Called when the node enters the scene tree for the first time.
func _ready():
	board = Board.new()
	# Creates a new board of size 50 x 50
	var width = 50
	var height = 50
	board.setup(width, height)



## Takes a card as input, and places that card at position x, y.
func place_card(card: Card, x: int, y: int):
	match(card.type):
		# Places a troop card
		Card.CardType.TROOP:
			var troop: Troop = Troop.new(card)
			board.units[x][y] = troop
			troop_placed.emit(troop, Vector2i(x, y))



## Moves a troop from one position to another.
## WARNING: If the move is invalid, then this function will throw
## an error.
func move_troop(from: Vector2i, to: Vector2i):
	pass
