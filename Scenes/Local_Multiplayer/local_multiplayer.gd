extends Node2D

var troop_scene = preload ("res://Scenes/Rendering/rendered_troop.tscn")
var hand_scene = preload ("res://Scenes/Card_Renderer/Card.tscn")
var card: Card

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
	# var fog: TileMap = $FogRenderer
	# fog.setup(board)
	# TEST
	# board.players[0].clear_fog([Vector2i(2, 2), Vector2i(3, 2), Vector2i(2, 1)])

	var instance1 = hand_scene.instantiate()
	instance1.position = Vector2(106, 233)
	instance1.scale.x = 0.15
	instance1.scale.y = 0.2
	%UI.add_child(instance1)
	
	var instance2 = hand_scene.instantiate()
	instance2.position = Vector2(283, 233)
	instance2.scale.x = 0.15
	instance2.scale.y = 0.2
	%UI.add_child(instance2)
	
	var instance3 = hand_scene.instantiate()
	instance3.position = Vector2(460, 233)
	instance3.scale.x = 0.15
	instance3.scale.y = 0.2
	%UI.add_child(instance3)
	
	var instance4 = hand_scene.instantiate()
	instance4.position = Vector2(637, 233)
	instance4.scale.x = 0.15
	instance4.scale.y = 0.2
	%UI.add_child(instance4)

	var instance5 = hand_scene.instantiate()
	instance5.position = Vector2(814, 233)
	instance5.scale.x = 0.15
	instance5.scale.y = 0.2
	%UI.add_child(instance5)

func hand():
	var instance = hand_scene.instantiate()
	%UI.add_child(instance)
## Renders a troop card by adding it to the scene tree
func render_troop(troop: Troop, pos: Vector2i):
	var instance = troop_scene.instantiate()
	instance.prepare_for_render(troop)
	instance.position = Vector2(pos) * TILE_SIZE
	add_child.call_deferred(instance)
