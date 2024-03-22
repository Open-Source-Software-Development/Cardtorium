extends TileMap

## Render possible moves on the tilemap with outline
func draw_move_outlines(possible_moves: Array, selected_troop_pos: Vector2i):
	for move_pos in possible_moves:
		set_cell(0, move_pos, 2, Vector2i(0, 0))
	
# Clear moves from the tilemap
func clear_move_outlines():
	clear()