extends Resource

## Contains the metadata for a card
class_name Card

## The different types of cards
enum CardType {TROOP, BUILDING, SPELL}

## The type of card that this object represents.
@export
var type: CardType

## The card's ID
@export
var id: int
@export 
var name: String
## Range is 1-5
@export
var rarity: int

@export
var health: int
@export
var attack: int
@export
var defense: int
@export
var attack_range: int
@export
var movement: int
@export
var cost: int
## The attributes of the card.
@export
var attributes = []
