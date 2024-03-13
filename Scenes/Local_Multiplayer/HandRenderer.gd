extends Control

var card_scene = preload ("res://Scenes/Card_Renderer/Card.tscn")

var player: Player
var XBOUND = [200, 952]
var YPOS = 550

## Initializes the hand renderer by connecting it to a player's hand
func connect_to_player(p: Player):
	player = p
	player.cards_drawn.connect(render_cards)
	player.cards_removed.connect(remove_cards)


## Renders the cards in a player's hand.
func render_cards(hand: Array[Card]):
	var cardsize = Vector2(1205, 1576)
	var num_cards = len(hand)
	var increment = float(XBOUND[1] - XBOUND[0]) / num_cards
	var xpos = XBOUND[0] + increment/2
	for card in hand:
		var rendered = card_scene.instantiate()
		add_child(rendered)
		rendered.setup(card)
		call_deferred("setup_card", rendered, Vector2(xpos, YPOS), 0.12, cardsize)
		xpos += increment


## Removes a card from the player's hand
func remove_cards(old_hand: Array[Card], new_hand: Array[Card]):
	# TODO: Add an animation here instead of just re-rendering the hand
	render_cards(new_hand)
	

## Helper function for positioning a card
func setup_card(rendered, pos, scale, size):
	rendered.size = size
	rendered.position = pos - (size*scale)/2
	rendered.scale.x = scale
	rendered.scale.y = scale