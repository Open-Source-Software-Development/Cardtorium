extends MarginContainer

@onready var card: Card = load("res://Cards/Troops/troop_1.tres")

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
@onready var atk = $MarginContainer2/VBoxContainer/MarginContainer2/Stat_Container/ATK_Container/ATK
@onready var def = $MarginContainer2/VBoxContainer/MarginContainer2/Stat_Container/DEF_Container/DEF
@onready var hp = $MarginContainer2/VBoxContainer/MarginContainer2/Stat_Container/HP_Container/HP
@onready var range = $MarginContainer2/VBoxContainer/MarginContainer2/Stat_Container/RANGE_Container/Range
@onready var move = $MarginContainer2/VBoxContainer/MarginContainer2/Stat_Container/MOVE_Container/Move
@onready var card_name = $MarginContainer2/VBoxContainer/Name

# MAX 30 WORD DESCRIPTIONS

# Called when the node enters the scene tree for the first time.
func _ready():
	atk.text = str(card.attack)
	def.text = str(card.defense)
	hp.text = str(card.health)
	range.text = str(card.attack_range)
	move.text = str(card.movement)
	card_name.text = card.name

	print(card.name)

	# match(card.type):
	# 	Card.CardType.TROOP:
	# 		bg.color = Color()
