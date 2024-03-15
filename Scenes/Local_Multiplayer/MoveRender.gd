extends TileMap

## Render possible moves on the tilemap
func draw_move_outlines(possible_moves: Array):
	for move_pos in possible_moves:
		set_cell(0, move_pos, 1, Vector2i(0, 0))

# Clear moves from the tilemap
func clear_move_outlines():
	clear()