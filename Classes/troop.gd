extends Unit

## Class which represents a troop on the board.
class_name Troop

## The troop id
var id: int = 0
## Whether or not the troop has moved
var has_moved: bool = false
## The base stats of the troop.
## WARNING: Do not modify!
var base_stats: Card
## Graph of tiles that the troop can move to.
var move_graph
## Stores the troop's attributes
var attributes: Array[TroopAttribute] = []


func _init(card: Card = null):
	self.id = card.id
	self.base_stats = card


## Helper function which returns all tiles within a certain
## radius of the center.
func _get_surrounding(center: Vector2i, radius: int) -> Array[Vector2i]:
	var output: Array[Vector2i] = []
	for x_off in range(-radius, radius+1):
		for y_off in range(-radius, radius+1):
			if x_off == 0 and y_off == 0:
				continue
			output.append(center + Vector2i(x_off, y_off))
	return output


## Builds a graph of the tiles that the unit can move to.
func build_graph(x: int, y: int, board: Board):
	var graph: Dictionary = {}
	var visited: Dictionary = {}
	var start = Vector2i(x, y)
	# Elements in the frontier take the form
	# [tile, strength, [path_to_tile]]
	var frontier: Array = []
	var strength: float = float(self.base_stats.movement)
	for surround in _get_surrounding(start, 1):
		var new_strength = self._calc_move_cost(strength, start, surround, board)
		if new_strength < 0:
			continue
		# Deep copies surround for the path
		var to = Vector2i(surround.x, surround.y)
		var path = [start, to]
		frontier.append([to, new_strength, path])
		# Adds nodes to the graph
		graph[to] = path
		visited[to] = new_strength
	# Runs breadth-first search
	while frontier:
		var node_data = frontier.pop_front()
		# Extract data
		var tile = node_data[0]
		strength = node_data[1]
		var path = node_data[2]
		# If the troop has no strength left, cannot move further
		if strength <= 0:
			continue
		# Search surrounding tiles
		for surround in _get_surrounding(tile, 1):
			var new_strength = self._calc_move_cost(strength, tile, surround, board)
			if new_strength < 0:
				continue
			var to = Vector2i(surround.x, surround.y)
			# Check if the node has already been visited.
			if to == start:
				continue
			elif to in visited:
				var old_strength = visited[to]
				# If the new path isn't better than the one we already visited,
				# we can skip the node. Otherwise, we have to re-visit it.
				if new_strength <= old_strength:
					continue
			var new_path = path + [to]
			frontier.append([to, new_strength, new_path])
			# Adds nodes to the graph
			graph[to] = new_path
			visited[to] = new_strength
	self.move_graph = graph


## Internal function which determines the cost of moving from a tile to a tile.[br]
func _calc_move_cost(strength: float, from: Vector2i, to: Vector2i, board: Board) -> float:
	var dest_type: Board.Terrain = board.tiles[to.x][to.y]
	# Checks if the move is even discovered
	if not board.players[self.owned_by].discovered[to.x][to.y]:
		return -1
	# Checks terrain type
	if dest_type == Board.Terrain.FOREST:
		return 0
	elif dest_type == Board.Terrain.MOUNTAIN:
		return 0
	elif dest_type == Board.Terrain.WATER:
		return -1
	# TODO: Check if there is an enemy nearby to apply zone-of-control
	return max(strength - 1, 0)


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


