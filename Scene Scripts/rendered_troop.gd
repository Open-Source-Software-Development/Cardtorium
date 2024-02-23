extends Node2D

var troop: Troop


# Called when the node enters the scene tree for the first time.
func prepare_for_render(troop_to_render: Troop):
	var sprite = $Sprite
	self.troop = troop_to_render
	var texture: Texture2D = load("res://Assets/Troop Sprites/idle_{0}.png".format({0: troop.id}))
	if texture != null:
		sprite.texture = texture
