extends Control


## The game object to render
@export var game: Game

## The initial mouse position
var initial_mouse_pos = Vector2.ZERO
## Whether the mouse button is currently down
var mouse_button_down = false
## Whether or not the player is dragging the mouse
var dragging = false
## How far the mouse must be dragged before registering as a drag event
var drag_threshold = 100

## The states which the UI can be in
enum STATE {UNSELECTED, TILE_SELECT, UNIT_SELECT, CARD_SELECT}

# Handles input
func _gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			mouse_button_down = true
			initial_mouse_pos = get_global_mouse_position()
		elif event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
			mouse_button_down = false
			if dragging:
				dragging = false
			else:
				# Handle mouse click
				var mouse_position = get_global_mouse_position()
				var world_position = get_global_transform().affine_inverse().basis_xform_inv(mouse_position)
				var tile_size = Vector2(64, 64)
				var tile_coordinates = floor(world_position / tile_size)
				var card: Card = load('res://Cards/Troops/troop_8.tres')
				game.place_card(card, tile_coordinates.x, tile_coordinates.y)

	elif event is InputEventMouseMotion and mouse_button_down:
		if initial_mouse_pos.distance_to(get_global_mouse_position()) > drag_threshold:
			dragging = true
			var drag_end_world_pos = get_global_mouse_position()
			var drag_distance = initial_mouse_pos - drag_end_world_pos
			position += drag_distance
			initial_mouse_pos = drag_end_world_pos


## Given the position of an on-screen click, determines what tile
## coordinate should be selected. Essentially, converts mouse coords
## to tile coords.
func _tile_clicked(click_pos: Vector2) -> Vector2i:
	return Vector2i.ZERO
