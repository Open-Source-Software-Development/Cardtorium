extends Node

## Class which contains the logic and data required to run a game.
## Does not contain any rendering functions or input processing.
class_name Game

## Contains the game's data. Saving the board to disk allows
## saving and loading games.
var board: Board = Board.new()

## Number of players
var num_players: int

## Notifies other nodes when a set of terrain tiles is changed.
signal terrain_updated(changed: Array[Vector2i], terrain: Board.Terrain)
## Emitted when a troop is placed.
signal troop_placed(troop: Troop, pos: Vector2i)
## Emitted when a player ends their turn.
signal turn_ended(local_id: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	board = Board.new()
	# Creates a new board of size 11 x 11
	var width = 11
	var height = 11
	board.setup(width, height, 2)
	num_players = 2


## Changes the terrain for an array of tiles
func set_terrain(terrain: Board.Terrain, location: Array[Vector2i]):
	for position in location:
		board.tiles[position.x][position.y] = terrain
	terrain_updated.emit(location, terrain)


## Takes a card as input, and places that card at position x, y.
func place_card(card: Card, x: int, y: int):
	match(card.type):
		# Places a troop card
		Card.CardType.TROOP:
			var troop: Troop = Troop.new(card)
			troop.owned_by = board.current_player
			board.units[x][y] = troop
			troop_placed.emit(troop, Vector2i(x, y))


## Places the nth card in the player's hand onto the board at position x, y
func place_from_hand(index: int, x: int, y: int):
	var player: Player = board.players[board.current_player]
	var card: Card = player.hand[index]
	player.remove_from_hand(index)
	self.place_card(card, x, y)



## Goes to the next player's turn
func end_turn():
	# Lets other nodes know that a player has ended their turn
	turn_ended.emit(board.current_player)
	# Updates current_player
	board.current_player += 1
	if board.current_player == num_players:
		board.current_player = 0
		board.turns += 1
	# Sets next player up to begin their turn
	board.players[board.current_player].begin_turn()



## Moves a troop from one position to another.
## WARNING: If the move is invalid, then this function will throw
## an error.
func troop_move(active_unit, selected_tile):
	if selected_tile in active_unit.move_graph and not active_unit.has_moved:
		#	clear the current tile
		_clear_troop(active_unit)
		#	put the troop on the new tile
		board.units[selected_tile.x][selected_tile.y] = active_unit
		#render_troop(active_unit, Vector2i(selected_tile.x, selected_tile.y))
		troop_placed.emit(active_unit, Vector2i(selected_tile.x, selected_tile.y))
		# TODO turns dont exist yet
		# update movement
		#active_unit.has_moved = true
		
func _clear_troop(troop: Troop):
	board.units[troop.pos.x][troop.pos.y] = null
	troop.inst.queue_free()

