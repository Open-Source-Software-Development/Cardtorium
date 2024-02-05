extends Unit

## Class which represents a troop on the board.
class_name Troop

var base_defense: int
var base_movement: int
var defense: int
var movement: int
var id: int = 0
var attributes = []

var graph

var has_moved: bool = false

@export var data: Card


## Initiallizes the object
func _init(card: Card):
	self.id = card.id
	base_attack = card.attack
	base_movement = card.movement
	base_defense = card.defense
	base_rng = card.attack_range
	base_health = card.health


## Loads resources when added to the scene tree
func _ready():
	print_debug("hi")
	var sprite = $Sprite
	var texture: Texture2D = load("res://Assets/Troop Sprites/troop_{0}.png".format({0: id}))
	if texture != null:
		sprite.texture = texture


## Builds a graph of the tiles that the unit can move to.
func build_graph(x: int, y: int, board: Board):
	pass


## After a graph has been built, used to build a path from
## the troop's starting position to the end position. This
## is used to animate the troop's movement.
## WARNING: This will throw an error if no graph is built, or
## if the values passed do not make sense.
func find_path(from: Vector2i, to: Vector2i):
	pass



## Frees a graph from memory
func clear_graph():
	pass


