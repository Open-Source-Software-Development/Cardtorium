extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Renders the background
	var board: Board = $Game.board
	var background: Sprite2D = $Background
	background.region_rect.size = 32 * Vector2(board.SIZE.x, board.SIZE.y)
	# Renders the tiles
	var terrain: TileMap = $TerrainRenderer
	terrain.board = board
	terrain.render_all()
