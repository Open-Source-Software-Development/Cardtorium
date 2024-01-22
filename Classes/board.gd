extends Resource

## A container for positional data used during the course
## of a game. Contains all the data necessary to save and
## load games. However, it contains no game logic
class_name Board

## Defines the terrain types
enum Tiles {GRASS=-1, FOREST, MOUNTAIN, WATER}

## 2D array which stores the terrain data for each grid
## of the board
var tiles: Array = []

## 2D array which stores territory data.
## A -1 means that the tile is unclaimed, whereas
## a nonnegative integer means that the tile has been
## claimed by player with that local id.
var territory: Array = []

## The number of players
var players: int

## Which player is currently taking their turn
var player: int

## The number of turns taken in the game
var turns: int

## Array which stores the position of units.
var units: Array = []

## Array which stores the position of buildings.
var buildings: Array = []

## The size of the board (in tiles) encoded as a vector
var SIZE: Vector2i

## Allocates memory for a game with wid by height tiles
func setup(wid: int, height: int):
    self.SIZE = Vector2i(wid, height)
    for x in range(wid):
        tiles.append([])
        for y in range(height):
            tiles[x].append(Tiles.GRASS)