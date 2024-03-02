extends Resource

## A container for positional data used during the course
## of a game. Contains all the data necessary to save and
## load games. However, it contains no game logic
class_name Board

## Defines the terrain types
enum Terrain {GRASS=-1, FOREST, MOUNTAIN, WATER}

## 2D array which stores the terrain data for each grid
## of the board
var tiles: Array = []

## 2D array which stores territory data.
## A -1 means that the tile is unclaimed, whereas
## a nonnegative integer means that the tile has been
## claimed by player with that local id.
var territory: Array = []

## 2D array which stores card locations.
var units: Array = []

## Stores the players of the game
var players: Array[Player]

## Which player is currently taking their turn
var current_player: int = 0

## The number of turns taken in the game
var turns: int = 0

## Array which stores the position of buildings.
var buildings: Array = []

## The size of the board (in tiles) encoded as a vector
var SIZE: Vector2i

## Allocates memory to set up an empty board with wid x height tiles.
func setup(wid: int, height: int, _num_players: int):
	# Allocates memeory for the tiles. 
	self.SIZE = Vector2i(wid, height)
	tiles.resize(wid)
	territory.resize(wid)
	units.resize(wid)
	for x in range(wid):
		# Sets the tiles
		tiles[x] = []
		tiles[x].resize(height)
		tiles[x].fill(Terrain.GRASS)
		# Sets the territory
		territory[x] = []
		territory[x].resize(height)
		territory[x].fill(-1)
		# Sets the units array
		units[x] = []
		units[x].resize(height)
		units[x].fill(null)
	players = []
	# TODO: Replace code below, and actually use the `num_players` variable
	players.append(Player.new(SIZE, Vector2i(0,SIZE.y / 2)))
	players.append(Player.new(SIZE, Vector2i(SIZE.x - 1,SIZE.y / 2)))
	players[0].local_id = 0
	players[1].local_id = 1