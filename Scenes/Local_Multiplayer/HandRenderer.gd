extends Control

var card_scene = preload ("res://Scenes/Card_Renderer/Card.tscn")

var player: Player
var XBOUND = [200, 952]
var YPOS = 550

## Initializes the hand renderer by connecting it to a player's hand
func setup(p: Player):
	player = p
	var cardsize = Vector2(1205, 1576)
	var num_cards = len(player.hand)
	var increment = float(XBOUND[1] - XBOUND[0]) / num_cards
	var xpos = XBOUND[0] + increment/2
	for card in player.hand:
		var rendered = card_scene.instantiate()
		add_child(rendered)
		rendered.setup(card)
		call_deferred("setup_card", rendered, Vector2(xpos, YPOS), 0.12, cardsize)
		xpos += increment


func setup_card(rendered, pos, scale, size):
	rendered.size = size
	rendered.position = pos - (size*scale)/2
	rendered.scale.x = scale
	rendered.scale.y = scale
	print(rendered.position)
