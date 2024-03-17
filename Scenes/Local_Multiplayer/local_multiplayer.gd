extends Node2D

var troop_scene = preload ("res://Scenes/Rendering/rendered_troop.tscn")
var card: Card

const TILE_SIZE = 64
@onready var game: Game = $Game
var selected_index = -1
var selected_tile: Vector2i = Vector2i()
signal card_placed(card_index: int)
@onready var move_renderer = $MoveRender
#@onready var ter_renderer = $TerrainRenderer
var active_unit = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# Renders the background
	var board: Board = game.board
	var background: Sprite2D = $Background
	background.region_rect.size = TILE_SIZE * Vector2(board.SIZE.x, board.SIZE.y)
	# Renders the tiles
	var terrain: TileMap = $TerrainRenderer
	terrain.board = board
	# terrain.render_all()
	# Renders fog
	var fog: TileMap = $FogRenderer
	fog.setup(board)
	# Sets up hand rendering
	var hand_renderer = $GUI_Renderer/HandRenderer
	hand_renderer.connect_to_player(board.players[board.current_player])
	board.players[0].begin_turn()

	var camera = $Camera2D
	camera.selected_tile.connect(self.on_selected_tile)
	hand_renderer.card_selected.connect(self.on_card_selected)

func on_card_selected(card_index: int):
	#selected_index = card_index
	if selected_index == card_index:
		# Deselect the card
		selected_index = -1
	else:
		# Select the card
		selected_index = card_index
		
func on_selected_tile(pos: Vector2i):
	selected_tile = pos
	check_and_place_card()

	var tile_content = game.board.units[selected_tile.x][selected_tile.y]
	if tile_content != null and tile_content is Troop and active_unit == null:
		var troop = tile_content as Troop
		troop.pos = selected_tile
		troop.build_graph(selected_tile.x, selected_tile.y, game.board)
		move_renderer.clear_move_outlines() # Clear previous move outlines
		move_renderer.draw_move_outlines(troop.move_graph.keys()) # Draw new move outlines
		active_unit = troop
	elif tile_content != null and tile_content is Troop:
		# defender
		var troop = tile_content as Troop
		move_renderer.clear_move_outlines() # Clear move outlines if not a troop
		if active_unit is Troop: 
			troop_attack(troop)
			active_unit = null
	else:
		move_renderer.clear_move_outlines() # Clear move outlines if not a troop
		if active_unit is Troop: 
			troop_move()
			active_unit = null

## Must first select card to place on a tile
func check_and_place_card():
	if selected_index != - 1:
		if selected_tile != null:
			var tile_content = game.board.units[selected_tile.x][selected_tile.y]
			if tile_content != null and tile_content is Troop:
				# Troop already exists on the selected tile, don't allow card placement
				return
			game.place_from_hand(selected_index, selected_tile.x, selected_tile.y)
			selected_index = -1
			selected_tile = Vector2i()
		else:
			# Deselect any selected tile
			selected_tile = Vector2i()

## Renders a troop card by adding it to the scene tree
func render_troop(troop: Troop, pos: Vector2i):
	var instance = troop_scene.instantiate()
	instance.prepare_for_render(troop)
	instance.position = Vector2(pos) * TILE_SIZE
	add_child.call_deferred(instance)
	troop.inst = instance

func troop_move():
	if selected_tile in active_unit.move_graph and not active_unit.has_moved:
		#	clear the current tile
		_clear_troop(active_unit)
		#	put the troop on the new tile
		game.board.units[selected_tile.x][selected_tile.y] = active_unit
		render_troop(active_unit, Vector2i(selected_tile.x, selected_tile.y))
		# TODO turns dont exist yet
		# update movement
		#active_unit.has_moved = true
		
func _clear_troop(troop: Troop):
	game.board.units[troop.pos.x][troop.pos.y] = null
	troop.inst.queue_free()

func troop_attack(defender: Troop):
	# active unit is the attacking troop
	# TODO check if active_unit has attacked
	# TODO get the stats of the active and defending units
	# TODO calculations
	# attack_force  = atk * curr_hp/max_hp
	# defense_force = def * curr_hp/max_hp
	# attack_dmg  = floor((atk_force/(atk_force+def_force))*atk)
	# TODO if attack damage kills defender, clear it and end early 
	# counter_dmg = floor((def_force/(atk_force+def_force))*def) 
	# TODO if counter damage kills active_unit, clear it 
	pass
