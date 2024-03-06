extends Node2D

var troop_scene = preload("res://Scenes/Rendering/rendered_troop.tscn")
const TILE_SIZE = 64
@onready var game: Game = $Game

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
	# TEST
	board.players[0].clear_fog([Vector2i(2, 2), Vector2i(3, 2), Vector2i(2, 1)])
	var card: Card = load('res://Cards/Troops/troop_1.tres')
	game.place_card(card, 1, 4)
	game.board.units[1][4].build_graph(1, 4, game.board)



## Renders a troop card by adding it to the scene tree
func render_troop(troop: Troop, pos: Vector2i):
	var instance = troop_scene.instantiate()
	instance.prepare_for_render(troop)
	instance.position = Vector2(pos) * TILE_SIZE
	add_child.call_deferred(instance)
