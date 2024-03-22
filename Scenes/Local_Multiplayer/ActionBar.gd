extends Control

signal attack_pressed
signal claim_pressed
signal end_turn_pressed

@onready var atk = $MarginContainer/ColorRect/MarginContainer/HBoxContainer/Button
@onready var claim = $MarginContainer/ColorRect/MarginContainer/HBoxContainer/Button2
@onready var end_turn = $MarginContainer/ColorRect/MarginContainer/HBoxContainer/Button3

# # Called when the attack button is clicked.
# func _on_attack_button_pressed():
# 	attack_pressed.emit()
# 	print("Attack button clicked")

# # Called when the claim button is clicked.
# func _on_claim_button_pressed():
# 	claim_pressed.emit()
# 	print("Claim button clicked")

# # Called when the end turn button is clicked.
# func _on_end_turn_button_pressed():
# 	end_turn_pressed.emit()
# 	print("End Turn button clicked")

# func _ready():
# 	# Connect button signals to their respective functions
# 	atk.pressed.connect(_on_attack_button_pressed)
# 	claim.pressed.connect(_on_claim_button_pressed)
# 	end_turn.pressed.connect(_on_end_turn_button_pressed)
