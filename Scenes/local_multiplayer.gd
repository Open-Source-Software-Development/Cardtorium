extends Node2D

var board: Board = Board.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Creates a new board of size 50 x 50
	var width = 50
	var height = 50
	board.setup(width, height)
	# Randomly set some tiles to forest tiles
	for i in range(30):
		board.tiles[randi()	% width][randi() % height] = board.Tiles.FOREST
	var background: Sprite2D
	background = $Background
	background.region_rect.size = 32 * Vector2(board.SIZE.x, board.SIZE.y)

