extends TileMap

var board: Board
var outline_tile: int = 3 # outline tile index

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
		notgrass[board.tiles[tile.x][tile.y] + 1].append(tile)
	for i in range(notgrass.size()):
		set_cells_terrain_connect(0, notgrass[i], 0, i - 1)
	
## Mouse hover effect on a tile
func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	var world_pos = get_global_transform().affine_inverse().basis_xform_inv(mouse_pos)
	var tile_size = Vector2(32, 32)
	var tile_pos = floor(world_pos / tile_size)

	# Clear all hover effects (layer 1)
	for x in board.SIZE.x:
		for y in board.SIZE.y:
			erase_cell(1, Vector2i(x, y))

	# Set hover effect on the tile the mouse is hovering over
	if tile_pos.x >= 0 and tile_pos.y >= 0 and tile_pos.x < board.SIZE.x and tile_pos.y < board.SIZE.y:
		set_cell(1, tile_pos, outline_tile, Vector2i(0, 0), 0)