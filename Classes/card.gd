extends Resource

## Contains the metadata for a card
class_name Card

## The different types of cards
enum CardType {TROOP, BUILDING, SPELL}

## The type of card that this object represents.
var type: CardType

## The attributes of the card.
var attributes = {}

var attack: int
var defense: int
var attack_range: int
var movement: int
