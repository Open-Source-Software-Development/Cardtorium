extends ColorRect

@onready var card: Card = load("res://Cards/Troops/test.tres")

'''
RARITY NAME COLORS:
- COMMON = BLACK (#000000)
- UNCOMMON = GREEN (#00f800)
- RARE = BLUE (#15ffed)
- EPIC = HOT PINK (#f600ff)
- LEGNEDARY = GOLD (#fdff00)

CARD TYPE BACKGROUND COLORS:
- TROOP = GREEN (#5f8352)
- SPELL = BLUE (#288784)
- BUILDING = TAN (#e9b996)

FACTION BORDER COLORS:
- IMPERIUM = GOLD (#fdff00)

'''


# STATS
@onready var atk = $ATK
@onready var def = $DEF
@onready var hp = $HP
@onready var range = $Range
@onready var move = $Move
@onready var card_name = $Name
@onready var bg = get_tree().get_root().get_node("Card")

# MAX 30 WORD DESCRIPTIONS


# Called when the node enters the scene tree for the first time.
func _ready():
	atk.text = str(card.attack)
	def.text = str(card.defense)
	hp.text = str(card.health)
	range.text = str(card.attack_range)
	move.text = str(card.movement)
	card_name.text = card.name

	# match(card.type):
	# 	Card.CardType.TROOP:
	# 		bg.color = Color()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
