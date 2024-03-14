extends Node2D

var troop_scene = preload ("res://Scenes/Rendering/rendered_troop.tscn")
var card: Card

const TILE_SIZE = 64
@onready var game: Game = $Game
var selected_card = null
var selected_tile: Vector2i = Vector2i()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Renders the background
	var board: Board = game.board
	var background: Sprite2D = $Background
	background.region_rect.size = TILE_SIZE * Vector2(board.SIZE.x, board.SIZE.y)
	# Renders the tiles
	var terrain: TileMap = $TerrainRenderer
	terrain.board = board
	terrain.render_all()
	# Renders fog
	var fog: TileMap = $FogRenderer
	fog.setup(board)
	# Sets up hand rendering
	var hand_renderer = $GUI_Renderer/HandRenderer
	hand_renderer.connect_to_player(board.players[board.current_player])
	board.players[0].begin_turn()
	# Places hand 
	var camera = $Camera2D
	camera.selected_tile.connect(self.on_selected_tile)
	hand_renderer.card_selected.connect(self.on_card_selected)

## Called when a card is selected
func on_card_selected(card: Card):
	selected_card = card

## Called when a tile is selected
func on_selected_tile(pos: Vector2i):
	selected_tile = pos
	check_and_place_card()

## Checks if a card is selected and a tile is selected before placing the card
func check_and_place_card():
	if selected_card != null:
		if selected_tile != null:
			game.place_card(selected_card, selected_tile.x, selected_tile.y)
			selected_card = null
			selected_tile = Vector2i()

## Renders a troop card by adding it to the scene tree
func render_troop(troop: Troop, pos: Vector2i):
	var instance = troop_scene.instantiate()
	instance.prepare_for_render(troop)
	instance.position = Vector2(pos) * TILE_SIZE
	add_child.call_deferred(instance)
