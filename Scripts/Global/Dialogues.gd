# Example of adding choices to a prompt
var greenObstacleHit = Prompt.new(
	"You just hit the green obstacle! What do you want to do?",
	[
		{"text": "Continue playing", "method": self.greenObstacleHit_a},
		{"text": "Quit the game", "method": self.greenObstacleHit_b}
	]
)

#No switch cases in GDScript so it was cleaner and easier to read like this
func greenObstacleHit_a():
	print("Continue playing")

func greenObstacleHit_b():
	print("Quit the game")
