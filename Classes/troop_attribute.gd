extends Node 

## Base class for troop
class_name TroopAttribute

# The name of the attribute
@export var attribute_name: String
# The ID of the attribute
@export var id: int
# The description of the attribute
@export var description: String


# Virtual function which can be overwritten by children
func on_moved(from: Vector2i, to: Vector2i):
    pass


## Virtual function which overrides movement costs.
## Overrides to this function can return a non-null value to change the move calculation.
## Otherwise, returning null uses the default tropp calculation.
## For information on the parameters, see [method Troop._calc_move_cost]
func calc_move_cost(strength: float, from: Vector2i, to: Vector2i, board: Board):
    return null