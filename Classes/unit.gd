extends Node

## Represents a single troop on the game board
class_name Unit


## Member variables

## The unit's position
var pos: Vector2i = Vector2i()
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
## The base stats of the unit.
## WARNING: Do not modify!
var base_stats: Card
## Dependency injection of the game object.
## Used to send signals and such.
var game: Game


## Called when the unit is attacked.
## 
## This handles counterattack calculations for [Troop] units, and damage
## calculations for buildings. In both cases, it runs attributes.
##
## Returns how much damage the opponent should take, if any
func being_attacked(attacker: Unit, attack: int, attack_force: float) -> int:
    return 0
