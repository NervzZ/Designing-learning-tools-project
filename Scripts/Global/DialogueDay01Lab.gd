extends Node

################################################################################
# Dialogues for Day 1 at the lab:
# Dialogues:
# 1. Welcome message
# 2. NPC talk about money and grants `discuss_entry_tech()`
# 3. NPC (optional) talk about safety `discuss_entry_safety_optional()`
#    a. Monologe after a failed experiment (either directly from dialogue 3,
#       or if we have time after a real experiment with teleporter)
################################################################################




################################################################################
# Welcome message
################################################################################
func welcomeToLabDialogue(): # <- Call this for welcome message
	GameManager.displayPrompt(welcomeToLab)
	
var welcomeToLab = Prompt.new(  # said by you (or narrator?)
	"This idea... it's huge. It's like nothing I've ever worked on before.
This could shape the future! It has so much potential...
But this comes with great responsibilities. Imagine if we could teleport anywhwere
anytime!",
	[
		{"text":"Ok", "method" : self.welcomeToLab_ok}
	],
	PromptSprites.playerTalker
)
var welcomeToLabStartWork = Prompt.new(  # said by you
	"Alright, I have a dream. Time to work to make it a reality!",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)

func welcomeToLab_ok():
	GameManager.closePrompt()
	GameManager.displayPrompt(welcomeToLabStartWork)


################################################################################
# First discussion with NPC (tech races and money problems)
# Discussion with `scientist01Talker`
################################################################################
func discuss_entry_tech():  # <- CALL this for dialogue
	if GameState.boolStates["TalkedAboutTechnologyRace"]:
		GameManager.displayPrompt(firstDiscussionWithNPC_after)
	else:
		GameManager.displayPrompt(firstDiscussionWithNPC)

func firstDiscussionWithNPC_ok():
	GameManager.closePrompt()
	GameManager.displayPrompt(firstDiscussionWithNPC_techRace)
func firstDiscussionWithNPC_end():
	GameManager.closePrompt()
	GameState.boolStates["TalkedAboutTechnologyRace"] = true
	GameManager.displayPrompt(firstDiscussionWithNPC_after)
var firstDiscussionWithNPC = Prompt.new( # said by scientist friend
	"Hey, got a sec? I've been thinking about your project. You've got something
special here, but you know how tech is. It's a race. If you don't secure funding
soon, someone else will beat you to it.",
	[
		{"text":"I know, but funding isn't easy to come by.","method": self.firstDiscussionWithNPC_ok}
	],
	PromptSprites.scientistBrownTalker
)
var firstDiscussionWithNPC_techRace = Prompt.new(  # said by scientist friend
	"True, but you've got to start somewhere. Ever thought about pitching to
investors or applying for grants? It's a risk, but worth it. You'll have what
you need to make your vision a reality.",
	[
		{"text":"You're right. I need to be proactive.","method": firstDiscussionWithNPC_end}
	],
	PromptSprites.scientistBrownTalker
)
var firstDiscussionWithNPC_after= Prompt.new( 
	"Glad we talked about that. We're in this together you know.",
	[
		{"text":"Leave","method": GameManager.closePrompt}
	],
	PromptSprites.scientistBrownTalker
)


################################################################################
# Optional discussion on safety
# Discussion with `scientist02Talker`
################################################################################
func discuss_entry_safety_optional(): # <- CALL this for dialogue
	if GameState.boolStates["TalkedAboutRisks"]:
		if not GameState.boolStates["InvestigatedRisks"]:
			GameManager.displayPrompt(optionalSafetyDiscussion_NotInvestigated)
		else:
			GameManager.displayPrompt(optionalSafetyDiscussion_AfterInvestigated)
	else:
		GameState.boolStates["TalkedAboutRisks"]=true
		GameManager.displayPrompt(optionalSafetyDiscussion)

func discuss_safety_dontcare():
	GameManager.closePrompt()
	GameState.boolStates["InvestigatedRisks"] = false
	GameManager.displayPrompt(optinalSafetyDiscussion_dontcare)
func discuss_safety_investigate():
	GameManager.closePrompt()
	GameState.boolStates["InvestigatedRisks"] = true
	GameManager.displayPrompt(optinalSafetyDiscussion_investigate)
var optionalSafetyDiscussion = Prompt.new(
	"Hey, I noticed you've been impatient to test the prototype.
Just a heads up, I've been reviewing the data and there are some concerning
signs of instability.
We should proceed with caution.",
	[
		{"text":"Listen to his concerns", "method":self.discuss_safety_investigate},
		{"text":"You've seen the data, his concerns are unfounded","method":self.discuss_safety_dontcare}
	],
	PromptSprites.scientistBlondeTalker
)
var optinalSafetyDiscussion_investigate = Prompt.new(
	"Thank you for the warning. It's tempting to rush things,
but you're right, I should proceed to further tests and ensure the
safety of the device",
[{"text":"Leave", "method": GameManager.closePrompt}],
PromptSprites.playerTalker
)
var optinalSafetyDiscussion_dontcare = Prompt.new(
	"I've seen the data too, I know what I'm dealing with and now is the time to see if it works. 
I'm so excited!!!",
[{"text":"Try it right now", "method": self.test_failing_teleporter},
{"text":"Try it later","method":GameManager.closePrompt}],
PromptSprites.playerTalker
)
var optionalSafetyDiscussion_NotInvestigated = Prompt.new(
	"Yo dude we should really be more careful",
	[
		{"text":"He's overreacting","method":discuss_safety_dontcare, "display":"KilledAnimals","inverse":true},
		{"text":"He might have a point","method":discuss_safety_investigate,"display":"KilledAnimals","inverse":true},
		{"text":"Leave","method":GameManager.closePrompt,"display":"KilledAnimals"}
	],
	PromptSprites.scientistBlondeTalker
)
var optionalSafetyDiscussion_AfterInvestigated = Prompt.new(
	"I'm so relieved you listened to me!",
	[
		{"text":"Leave","method":GameManager.closePrompt}
	],
	PromptSprites.scientistBlondeTalker
)
##########
# kinda related, technically, could have this part after actually testing the teleporter
##########
func test_failing_teleporter(): # <- CALL when testing teleporter and it fails!
	GameState.boolStates["KilledAnimals"]=true
	GameState.mistakes_made += 1
	GameManager.displayPrompt(optionalSafetyTryTeleporter)

var optionalSafetyTryTeleporter = Prompt.new(
	"Oh no... I did not anticipate this would harm creatures bigger than rats!?
What the hell? Where did I go wrong? I should really learn patience!",
[{"text":"Leave","method":GameManager.closePrompt}],
PromptSprites.playerTalker
)
func tmp():#rm at the end, just for not getting compiler warnings
	pass

