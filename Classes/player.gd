extends Resource

## Stores the data and such for a single player of Cardtorium
class_name Player

## How many cities the player owns
var cities: int
## How many cards a player can have in their hand
var hand_size: int = 5
## How much territory the player owns
var owned: int
## The player's local id. Is set by the game object
var local_id: int
## Stores the tiles which have yet to be discovered. An undiscovered tile is
## denoted by false, discovered by true
var discovered: Array
## Location of the home base.
var base_position: Vector2i
## How many resources the player owns
var resources: int = 3
## How many resources per turn the player earns
var rpt: int = 2
## The player's deck. The front of the array is the top of the deck.
var deck: Array[Card]
## The player's hand
var hand: Array[Card]

## Creates a new player resource from scratch
func _init(board_size: Vector2i, start_location: Vector2i):
    discovered = []
    for x in range(board_size.x):
        discovered.append([])
        for y in range(board_size.y):
            discovered[x].append(false)
    base_position = Vector2i(start_location.x, start_location.y)
    # Clears the fog in a 2-tile radius around the home base
    for x in range(base_position.x - 2, base_position.x + 3):
        if x < 0:
            continue
        elif x >= board_size.x:
            break
        for y in range(base_position.y - 2, base_position.y + 3):
            if y < 0:
                continue
            elif y >= board_size.y:
                break
            discovered[x][y] = true


## Called right before the player's turn begins
func begin_turn():
    # Increments resources
    resources += rpt
    # Sets hand size
    hand_size = max(hand_size, cities)
    # Draws cards until the hand is full
    var current_hand_size = len(hand)
    for i in range(current_hand_size, hand_size):
        hand.append(deck.pop_front())