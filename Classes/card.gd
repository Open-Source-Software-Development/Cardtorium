extends Resource

## Contains the metadata for a card
class_name Card

## The different types of cards
enum CardType {TROOP, BUILDING, SPELL}

## The different card rarities
enum CardRarity {COMMON, UNCOMMON, RARE, EPIC, LEGENDARY}

## The type of card that this object represents.
@export var type: CardType

## Rarity of the card
@export var rarity: CardRarity

## The attributes of the card.
@export var attributes: Array = []

## The card's ID
@export var id: int

@export var name: String

@export var health: int
@export var attack: int
@export var defense: int
@export var attack_range: int
@export var movement: int
