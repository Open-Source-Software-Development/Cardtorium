extends MarginContainer

var card: Card

var card_index: int
signal card_focused(card_index)
signal card_unfocused(card_index)
signal card_clicked(card_index)

# Add a dictionary to store whether a card is rendered on a tile
var cards_on_tiles = {}

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

func setup(_card: Card, _card_index: int):
	card = _card
	card_index = _card_index
	atk.text = str(card.attack)
	def.text = str(card.defense)
	hp.text = str(card.health)
	range.text = str(card.attack_range)
	move.text = str(card.movement)
	card_name.text = card.name

## Mouse hover on card
func _on_focus_mouse_entered():
	emit_signal("card_focused", card_index)

## Mouse hover off card
func _on_focus_mouse_exited():
	emit_signal("card_unfocused", card_index)

## Mouse click on card
func _on_focus_pressed():
	emit_signal("card_clicked", card_index)
