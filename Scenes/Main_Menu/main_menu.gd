extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var deck_button = $MarginContainer/HBoxContainer/VBoxContainer/Deck_Button as Button
@onready var options_menu = $Options_Menu as OptionsMenu
@onready var browser_menu = $Browser
@onready var margin_container = $MarginContainer as MarginContainer
@export var start_level = preload("res://Scenes/local_multiplayer.tscn") as PackedScene

# Title Color
@onready var title1 = $MarginContainer/VBoxContainer/Title1
@onready var title2 = $MarginContainer/VBoxContainer/Title2
@onready var title3 = $MarginContainer/VBoxContainer/Title3
@onready var title4 = $MarginContainer/VBoxContainer/Title4
@onready var title5 = $MarginContainer/VBoxContainer/Title5
@onready var titles = [title1, title2, title3, title4, title5]

# Background
@onready var bg1 = $BgForest
@onready var bg2 = $BgFire
@onready var bg3 = $BgBeach
@onready var bg4 = $BgMountain
@onready var bg5 = $BgPlains
@onready var bgs = [bg1, bg2, bg3, bg4, bg5]

var rng = RandomNumberGenerator.new()


func _ready():
	handle_connecting_signals()
	var index = rng.randi_range(0,4)
	# print_debug(titles[index])
	titles[index].visible = true
	bgs[index].visible = true

	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_exit_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false

func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)
	deck_button.button_down.connect(on_deck_browse_pressed)
	browser_menu.exit_browser.connect(on_exit_browse_pressed)

func on_exit_pressed() -> void:
	get_tree().quit()

func on_deck_browse_pressed():
	margin_container.visible = false
	browser_menu.visible = true

func on_exit_browse_pressed():
	browser_menu.visible = false
	margin_container.visible = true
	
