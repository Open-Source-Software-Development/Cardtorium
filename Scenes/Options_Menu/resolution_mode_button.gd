extends Control

@onready var option_button = $HBoxContainer/OptionButton as OptionButton

## Resolution Dropdown Options
const RESOLUTION_DICTIONARY: Dictionary = {
	"1152 x 648": Vector2(1152, 648),
	"1280 x 720": Vector2(1200, 720),
	"1920 x 1080": Vector2(1920, 1080),
	"2560 x 1440": Vector2(2560, 1440),
	"3840 x 2160": Vector2(3840, 2160)
}
func _ready():
	option_button.item_selected.connect(on_resolution_selected)
	add_resolution_items()

## Add resolution items to the dropdown
func add_resolution_items() -> void:
	for resolution in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution)

## Set the resolution of the game
func on_resolution_selected(index: int) -> void:
	var resolution = RESOLUTION_DICTIONARY[option_button.get_item_text(index)]
	get_viewport().size = resolution
