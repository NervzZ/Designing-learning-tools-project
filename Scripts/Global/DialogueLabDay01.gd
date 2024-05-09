extends Node

################################################################################
# Welcome message
################################################################################
func welcomeToLabDialogue(): # <- Call this for welcome message
	GameManager.displayPrompt(DialogueLabDay01.welcomeToLab)
	
var welcomeToLab = Prompt.new(  # said by you (or narrator?)
	"We are about to make a breakthrough in Teleportation.",
	[
		{"text":"Ok", "method" : self.welcomeToLab_ok}
	],
	PromptSprites.playerTalker
)
var welcomeToLabStartWork = Prompt.new(  # said by you
	"Allright, I have a dream. Time to work to make it a reality!",
	[
		{"text":"Ok", "method" : GameManager.closePrompt}
	],
	PromptSprites.playerTalker
)

func welcomeToLab_ok():
	GameManager.closePrompt()
	GameManager.displayPrompt(welcomeToLabStartWork)


################################################################################
# First discussion with NPC (info about time limits and others getting close)
# Discussion with `scientist01Talker`
################################################################################
func dicussTechRace():  # <- CALL this for dialogue
	if GameState.boolStates["TalkedAboutTechnologyRace"]:
		GameManager.displayPrompt(firstDiscussionWithNPC_after)
	else:
		GameManager.displayPrompt(firstDiscussionWithNPC)

func firstDiscussionWithNPC_ok():
	GameManager.closePrompt()
	GameState.boolStates["TalkedAboutTechnologyRace"] = true
	GameManager.displayPrompt(firstDiscussionWithNPC_techRace)
var firstDiscussionWithNPC = Prompt.new( # said by scientist friend
	"Hey! Glad you stopped by, we really need to hurry up our development,
	 otherwise the other teams are gonna beat us to the first functional teleporter!",
	[
		{"text":"I know, but we're super close now","method": self.firstDiscussionWithNPC_ok}
	],
	PromptSprites.scientist01Talker
)
var firstDiscussionWithNPC_techRace = Prompt.new(  # said by scientist friend
	"I sure hope so, this is turning into a real technology race...",
	[
		{"text":"I know, but we're super close now","method": GameManager.closePrompt}
	],
	PromptSprites.scientist01Talker
)
var firstDiscussionWithNPC_after= Prompt.new( 
	"Glad we talked about that.",
	[
		{"text":"Leave","method": GameManager.closePrompt}
	],
	PromptSprites.scientist01Talker
)


################################################################################
# Optional discussion on safety
# Discussion with `scientist02Talker`
################################################################################
func discuss_safety_optional(): # <- CALL this for dialogue
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
	PromptSprites.scientist01Talker
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
	PromptSprites.scientist01Talker
)
var optionalSafetyDiscussion_AfterInvestigated = Prompt.new(
	"I'm so relieved you listened to me!",
	[
		{"text":"Leave","method":GameManager.closePrompt}
	],
	PromptSprites.scientist01Talker
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

