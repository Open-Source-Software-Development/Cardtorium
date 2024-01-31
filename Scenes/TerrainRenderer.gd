extends TileMap

var board: Board


## Renders the entire board
func render_all():
	var notgrass = []
	notgrass.resize(len(board.Terrain) - 1)
	for i in range(notgrass.size()):
		notgrass[i] = []
	clear()
	for x in range(board.SIZE.x):
		for y in range(board.SIZE.y):
			if board.tiles[x][y] < 0:
				continue	
			notgrass[board.tiles[x][y]].append(Vector2i(x, y))
	for i in range(notgrass.size()):
		set_cells_terrain_connect(0, notgrass[i], 0, i)


## Re-renders a set of tiles
func render(tiles: Array, terrain: Board.Terrain):
	# If all tiles are set to the same terrain, no need to loop
	# or anything
	if terrain != null:
		set_cells_terrain_connect(0, tiles, 0, terrain)
		return
	# Otherwise we have to do it ourselves
	var notgrass = []
	notgrass.resize(len(Board.Terrain))
	for i in range(notgrass):
		notgrass[i] = []
	for tile in tiles:
		notgrass[board.tiles[tile.x][tile.y]+1].append(tile)
	for i in range(notgrass.size()):
		set_cells_terrain_connect(0, notgrass[i], 0, i-1)
	
