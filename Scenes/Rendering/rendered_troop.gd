extends Node2D

var troop: Troop


# Called when the node enters the scene tree for the first time.
func prepare_for_render(troop_to_render: Troop, game: Game):
	var sprite = $Sprite
	self.troop = troop_to_render
	var texture: Texture2D = load("res://Assets/Troop Sprites/idle_{0}.png".format({0: troop.id}))
	if texture != null:
		sprite.texture = texture
	game.troop_moved.connect(self.on_troop_moved)
	game.unit_removed.connect(self.on_troop_died)


## Called when a troop is moved
func on_troop_moved(_troop: Troop, path: Array):
	if _troop != self.troop:
		return
	position = 64 * path[-1]


## Called when a troop dies
func on_troop_died(unit: Unit):
	if unit is Troop and unit == troop:
		self.queue_free()

