extends Unit

## Class which represents a troop on the board.
class_name Troop

var id: int = 0
var graph
var has_moved: bool = false
var base_stats: Card


func _init(card: Card = null):
	self.id = card.id
	self.base_stats = card



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


