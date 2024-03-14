extends Control

@onready var audio_name = $HBoxContainer/AudioName as Label
@onready var audio_num = $HBoxContainer/AudioNum as Label
@onready var h_slider = $HBoxContainer/HSlider as HSlider

@export_enum("Master", "Music", "Sfx") var bus_name: String
var bus_index: int = 0

func _ready():
    h_slider.value_changed.connect(on_value_changed)
    get_bus_name_by_index()
    set_name_label_text()
    set_slider_value()

## Volume type 
func set_name_label_text() -> void:
    audio_name.text = str(bus_name) + " Volume"

## Volume amount
func set_audio_num_label_text() -> void:
    audio_num.text = str(h_slider.value * 100) + "%"

## Convert linear to db for audio volume
func get_bus_name_by_index() -> void:
    bus_index = AudioServer.get_bus_index(bus_name)

## Convert db to linear for slider value
func set_slider_value() -> void:
    h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
    set_audio_num_label_text()

## Set volume
func on_value_changed(value):
    AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
    set_audio_num_label_text()
