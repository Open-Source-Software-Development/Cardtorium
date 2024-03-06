extends ParallaxBackground
@onready var one = $Sprite1
@onready var two = $Sprite2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= 40 * delta

	one.play("walk")
	two.play("walk")