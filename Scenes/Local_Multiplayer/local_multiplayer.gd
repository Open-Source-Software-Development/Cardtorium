extends Node2D

var troop_scene = preload ("res://Scenes/Rendering/rendered_troop.tscn")
var card: Card

const TILE_SIZE = 64
@onready var game: Game = $Game
var selected_index = -1
var selected_tile: Vector2i = Vector2i()
signal card_placed(card_index: int)
@onready var move_renderer = $MoveRender
@onready var hand_renderer = $GUI_Renderer/HandRenderer
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
	hand_renderer.connect_to_player(board.players[board.current_player])
	board.players[0].begin_turn()

	var camera = $Camera2D
	camera.selected_tile.connect(self.on_selected_tile)
	hand_renderer.card_selected.connect(self.on_card_selected)

func on_card_selected(card_index: int):
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
		move_renderer.draw_move_outlines(troop.move_graph.keys(), selected_tile) # Draw move outlines
		active_unit = troop
	elif tile_content != null and tile_content is Troop:
		# defender
		var troop = tile_content as Troop
		move_renderer.clear_move_outlines() # Clear move outlines if not a troop
		if active_unit is Troop and active_unit != troop: 
			active_unit.troop_attack(troop)
			active_unit = null
	else:
		move_renderer.clear_move_outlines() # Clear move outlines if not a troop
		if active_unit is Troop: 
			game.troop_move(active_unit, selected_tile)
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
