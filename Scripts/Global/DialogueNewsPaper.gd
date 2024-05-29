extends Node

################################################################################
# Dialogues The daily newspaper
################################################################################

	
var day02Generalities = Prompt.new(  # said by you (or narrator?)
	"BREAKING NEWS\n"+
	"Overseas technology giant started testing 'teleportation fluid' on rats, "+
	"killing off over 300 during initial trials!",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)

var day03IfSoldArmy = Prompt.new(
	"BREAKING NEWS\n"+
	"Local science lab sells teleportation prototype to the army! "+
	"Philosophers, pacifists and many others voice their concerns in an open letter.",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)

var day03IfNotArmy = Prompt.new(
	"BREAKING NEWS\n"+
	"Overseas conflict seems inevitable."+
	" As tension arise the citizens fear the coming of a war which would hit homeland.",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)

var day04IfDidDumbShit = Prompt.new(
	"BREAKING NEWS\n"+
	"The national bank was robbed of its gold reserves! "+
	"Nothing recorded on tapes, noone saw anything, its as if by magic, acclaims local police officer.",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)

var day04IfSoldToCorporations = Prompt.new(
	"BREAKING NEWS\n"+
	"Professor for economics believes a huge technological revolution is upon us,"+
	" stating that 'the stock market is showing all the signs!'",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)

var day04IfNotSoldToCorporations = Prompt.new(
	"BREAKING NEWS\n"+
	"Local scientist fears they may be losing the technology race for the world's first teleporter due to lack of funding: "+
	"'With the current budget, we can't even afford to eat.' reveals insider.",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)

var day05IfRgulate = Prompt.new(
	"BREAKING NEWS\n"+
	"Politicians have finally woken up! "+
	"A government spokesperson confirmed that they are collaborating with leading scientist to regulate the future of teleportation.",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)

var day05IfNotRgulate = Prompt.new(
	"BREAKING NEWS\n"+
	"Greedy politicians are back!"+
	"According to a trusted source, the government was planning to add a huge tax on technology that doesn't even exist yet!",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.paper
)
