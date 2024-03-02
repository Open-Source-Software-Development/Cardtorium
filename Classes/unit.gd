extends Node

## Represents a single troop on the game board
class_name Unit


## Member variables

## The base health of the unit. Does not change after initialization.
var base_health: int
## The base attack of the unit. Does not change after initialization.
var base_attack: int
## The default range of the unit.
var base_rng: int
## Current health of the unit
var health: int
## Current attack of the unit
var attack: int
## Current range of the unit
var rng: int
## Stores active status effects.
var effects = []
## Keeps track of which player currently owns the unit
var owned_by: int
