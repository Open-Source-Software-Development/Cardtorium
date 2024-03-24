extends RichTextLabel

#signal game_ready()
@onready var game: Game = $/root/LocalMultiplayer/Game

func _ready():
	game.render_topbar.connect(self._on_game_render_topbar)

func _on_game_render_topbar(turn: int, player: Player):
	var form_ret: String
	var actl_ret: String
	# TODO username and message BBcode embedding safeguards:
		# https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html
	form_ret = "[center]Turn: %d\t\t\t\t\t\tPlayer: %s\t\t\t\t\t\tResources: %d\t\t\t\t\t\tRpT: %d\t\t\t\t\t\tTerritory Owned: %d\t\t\t\t\t\tCities: %d\t\t\t\t\t\t[/center]"
	actl_ret = form_ret % [turn, player.name, player.resources, player.rpt, player.owned, player.cities]
	
	set_text(actl_ret)
