extends Resource

## Contains the metadata for a card
class_name Card

## The different types of cards
enum CardType {TROOP, BUILDING, SPELL}

## The type of card that this object represents.
@export
var type: CardType

## The attributes of the card.
@export
var attributes = []

## The card's ID
@export
var id: int

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