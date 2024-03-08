extends Control


## The game object to render
@export var game: Game

## The states which the UI can be in
enum STATE {UNSELECTED, TILE_SELECT, UNIT_SELECT, CARD_SELECT}

# Handles input
func _gui_input(event):
	pass
			

## Given the position of an on-screen click, determines what tile
## coordinate should be selected. Essentially, converts mouse coords
## to tile coords.
func _tile_clicked(click_pos: Vector2) -> Vector2i:
	return Vector2i.ZERO
