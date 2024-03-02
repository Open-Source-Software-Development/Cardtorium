extends Resource 

## A container for attribute data which needs to be rendered onto the screen.
## This class contains no logic. Logic is found within instances of TroopAttribute,
## BuildingAttribute, and SpellAttribute.
class_name Attribute

# The name of the attribute
@export var name: String
# A description of the attribute
@export var description: String
# The attribute id
@export var id: int