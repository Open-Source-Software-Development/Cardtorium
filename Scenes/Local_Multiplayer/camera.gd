extends Camera2D

# Called when the node enters the scene tree for the first time.

var vel: Vector2 = Vector2.ZERO
var speed = 300
var initial_mouse_pos = Vector2.ZERO
var mouse_button_down = false
var dragging = false
var drag_threshold = 30 # must drag this many pixels to be considered a drag
signal selected_tile(Vector2)
var card_placement_allowed = false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			mouse_button_down = true
			initial_mouse_pos = get_global_mouse_position()
		elif event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
			mouse_button_down = false
			if dragging:
				dragging = false
			else:
				handle_click()

	elif event is InputEventMouseMotion and mouse_button_down:
		if initial_mouse_pos.distance_to(get_global_mouse_position()) > drag_threshold:
			dragging = true
			var drag_end_world_pos = get_global_mouse_position()
			var drag_distance = initial_mouse_pos - drag_end_world_pos
			position += drag_distance
			initial_mouse_pos = drag_end_world_pos

func _unhandled_key_input(event):
	# Checks for up-down motion
	if event.is_action_pressed("camera_up"):
		vel.y = -speed
	elif event.is_action_pressed("camera_down"):
		vel.y = speed
	if vel.y < 0 and event.is_action_released("camera_up"):
		vel.y = 0
	elif vel.y > 0 and event.is_action_released("camera_down"):
		vel.y = 0
	# Checks for left-right motion
	if event.is_action_pressed("camera_left"):
		vel.x = -speed
	elif event.is_action_pressed("camera_right"):
		vel.x = speed
	if vel.x < 0 and event.is_action_released("camera_left"):
		vel.x = 0
	elif vel.x > 0 and event.is_action_released("camera_right"):
		vel.x = 0

func _physics_process(delta):
	position += delta * vel

func handle_click():
	if not card_placement_allowed:
		return
	var mouse_position = get_global_mouse_position()
	var world_position = get_global_transform().affine_inverse().basis_xform_inv(mouse_position)
	var tile_size = Vector2(64, 64)
	var tile_coordinates = floor(world_position / tile_size)

	emit_signal("selected_tile", tile_coordinates)
	
## Can place cards when not over a card
func _on_hand_renderer_mouse_entered():
	card_placement_allowed = true

## Can't place cards when over a card
func _on_hand_renderer_mouse_exited():
	card_placement_allowed = false
