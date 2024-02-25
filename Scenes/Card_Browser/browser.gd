extends Control
@onready var back_button = $Back as Button

signal exit_browser


# Called when the node enters the scene tree for the first time.
func _ready():
	back_button.button_down.connect(on_exit_browser_pressed)
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_exit_browser_pressed():
	exit_browser.emit()
	set_process(false)
