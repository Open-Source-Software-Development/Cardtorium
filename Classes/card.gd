extends Resource

## Contains the metadata for a card
class_name Card

## The different types of cards
enum CardType {TROOP, BUILDING, SPELL}

## The different rarities of cards
enum CardRarity {COMMON, UNCOMMON, RARE, EPIC, LEGENDARY}

## The type of card that this object represents.
@export var type: CardType
## The card's ID
@export var id: int
## The name of the card
@export var name: String
## The rarity of the card
@export var rarity: CardRarity
## The card's HP
@export var health: int
## The card's attack
@export var attack: int
## The card's defense
@export var defense: int
## The card's range
@export var attack_range: int
## The card's movement
@export var movement: int
## The cost to place the card
@export var cost: int
## The attribute ids of the card.
@export var attributes: Array[int] = []
