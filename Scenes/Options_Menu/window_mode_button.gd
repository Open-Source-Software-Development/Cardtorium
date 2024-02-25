extends Control

@onready var option_button = $HBoxContainer/OptionButton as Button

const WINDOW_MODE_ARRAY : Array[String] = [
	"Window Mode",
	"Full-Screen"
]

func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)

func add_window_mode_items() -> void:
	for mode in WINDOW_MODE_ARRAY:
		option_button.add_item(mode)

func on_window_mode_selected(index : int) -> void:
	match index:
		0: # Window Mode
			get_window().mode = Window.MODE_WINDOWED
		1: # Full-Screen
			get_window().mode = Window.MODE_FULLSCREEN
			
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
