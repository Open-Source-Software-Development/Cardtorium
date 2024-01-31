extends Camera2D


# Called when the node enters the scene tree for the first time.

var vel: Vector2 = Vector2.ZERO
var speed = 300

func _unhandled_key_input(event):
	# Checks for up-down motion
	if event.is_action_pressed("camera_up"):
		vel.y = -speed
	elif event.is_action_pressed("camera_down"):
		vel.y = speed
	if vel.y < 0 and event.is_action_released("camera_up"):
		vel.y = 0
	elif vel.y > 0 and event.is_action_released("camera_down"):
		vel.y = 0
	# Checks for left-right motion
	if event.is_action_pressed("camera_left"):
		vel.x = -speed
	elif event.is_action_pressed("camera_right"):
		vel.x = speed
	if vel.x < 0 and event.is_action_released("camera_left"):
		vel.x = 0
	elif vel.x > 0 and event.is_action_released("camera_right"):
		vel.x = 0

	


func _physics_process(delta):
	position += delta * vel

