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