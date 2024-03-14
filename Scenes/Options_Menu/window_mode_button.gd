extends Control

@onready var option_button = $HBoxContainer/OptionButton as Button

## Window Modes
const WINDOW_MODE_ARRAY: Array[String] = [
	"Window Mode",
	"Full-Screen"
]

func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)

## Add Window Mode Items
func add_window_mode_items() -> void:
	for mode in WINDOW_MODE_ARRAY:
		option_button.add_item(mode)

## Change window mode based on the selected index
func on_window_mode_selected(index: int) -> void:
	match index:
		0: # Window Mode
			get_window().mode = Window.MODE_WINDOWED
		1: # Full-Screen
			get_window().mode = Window.MODE_FULLSCREEN