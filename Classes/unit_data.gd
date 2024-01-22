extends Resource

## Stores data relating to a specific unit on the board
class_name UnitData

## The base health of the unit. Does not change after initialization.
var base_health: int
## The base defense of the unit. Does not change after initialization.
var base_defence: int
## The base attack of the unit. Does not change after initialization.
var base_attack: int

## Position of the unit (in tiles) as a vector
var position: Vector2i

## Current health of the unit
var health: int
## Current defense of the unit
var defense: int
## Current attack of the unit
var attack: int