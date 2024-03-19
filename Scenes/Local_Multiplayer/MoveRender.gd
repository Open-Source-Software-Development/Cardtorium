extends TileMap

## Render not possible moves on the tilemap with shade
func draw_move_outlines(possible_moves: Array, selected_troop_pos, board_size: Vector2):
	for x in range(board_size.x):
		for y in range(board_size.y):
			var pos = Vector2i(x, y)
			if pos not in possible_moves and pos != selected_troop_pos:
				set_cell(0, pos, 0, Vector2i(0, 0))
				
## Render possible moves on the tilemap with outline
# func draw_move_outlines(possible_moves: Array):
# 	for move_pos in possible_moves:
# 		set_cell(0, move_pos, 0, Vector2i(0, 0))
	
# Clear moves from the tilemap
func clear_move_outlines():
	clear()