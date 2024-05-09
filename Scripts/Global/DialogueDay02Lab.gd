extends Node

################################################################################
# Dialogues for Day 2 at the lab:
# Dialogues:
# 1. Army guy wants to buy prototype `discuss_entry_armyguy()`
# 2. Discuss with lab (guy likes the army) `discuss_entry_army_lab_positive()`
# 3. Discuss with lab (hates likes the army) `discuss_entry_army_lab_negative()`
################################################################################



################################################################################
# Talk to the army guy
################################################################################
func discuss_entry_armyguy(): # <- call this when interacting with army guy
	if GameState.boolStates["finishedTalkingWithArmyguy"]:
		if GameState.boolStates["refusedArmyGuy"]:
			GameManager.displayPrompt(armyGuyDialogueAfterRefuse)
		elif (GameState.boolStates["soldToArmyGuyNoRestrictions"] or 
				GameState.boolStates["soldToArmyGuyWithRestrictions"]):
			GameManager.displayPrompt(armyGuyDialogueAfterAccept)
		else:
			print("Something went wrong...")
	elif GameState.boolStates["startedTalingWithArmyguy"]:
		GameManager.displayPrompt(armyGuyAskForDecision)

	else:
		GameState.boolStates["startedTalingWithArmyguy"]=true
		GameManager.displayPrompt(armyGuyDialoguePitch)

var armyGuyDialoguePitch = Prompt.new(
	"Hello. I assume you've been informed of my visit today? I am [Army Guy], "+
	"head of the military procurement department. "+
	"I wanted to discuss the future of your teleporter prototype in person. We're "+
	"very impressed with what we've seen so far. We believe this could be a "+
	"game-changer and would like to discuss the possibility of acquiring it for "+
	"military use.",
[
	{"text":"Accept","method":accept_army_guy},
	{"text":"Accept, with restrictions.","method":accept_army_conditions,"display":"discussedArmyGuyWithLab"},
	{"text":"Refuse","method":refuse_army_guy},
	{"text":"Discuss with the others","method":GameManager.closePrompt},
],
PromptSprites.armyguytalker
)
var armyGuyAskForDecision = Prompt.new(
	"What is your answer young man ? Think of the possibilities, the advancement
in national security. You could become famous",
[
	{"text":"Accept","method":self.accept_army_guy},
	{"text":"Accept, with restrictions.","method":GameManager.closePrompt,"display":"discussedArmyGuyWithLab"},
	{"text":"Refuse","method":GameManager.closePrompt},
	{"text":"Discuss with the others","method":GameManager.closePrompt},
],
PromptSprites.armyguytalker
)
#case accept no conditions:
func accept_army_guy():
	GameManager.closePrompt()
	GameState.boolStates["finishedTalkingWithArmyguy"] = true
	GameState.boolStates["soldToArmyGuyNoRestrictions"] = true #is this instant failure?
	GameManager.displayPrompt(armyGuyDialogueAfterAccept)
var armyGuyDialogueAfterAccept = Prompt.new(
	"A pleasure doing business with you.",
[{"text":"Leave","method":GameManager.closePrompt}],
PromptSprites.armyguytalker
)
# case accept with conditions:
func accept_army_conditions():
	GameManager.closePrompt()
	GameState.boolStates["finishedTalkingWithArmyguy"] = true
	GameState.boolStates["soldToArmyGuyWithRestrictions"] = true #is this instant failure?
	GameManager.displayPrompt(armyGuyDialogueAcceptConditions)
func after_accept_conditionally():
	GameManager.closePrompt()
	GameManager.displayPrompt(armyGuyDialogueAfterCondition)
var armyGuyDialogueAcceptConditions = Prompt.new(
	"I'm open to the idea of selling it, but I have some conditions. I want "+
	"strict limitations on how the technology can be used, particularly to ensure "+
	"it's not used for anything harmful",
[{"text":"Next","method":self.after_accept_conditionally}],
PromptSprites.playerTalker
)
var armyGuyDialogueAfterCondition = Prompt.new(
	"We understand your concerns. We're willing to negotiate terms that prioritize safety and "+
	"ethical use of the technology. I'm sure we can hash out a deal that's in everyone's best interest. ",
[{"text":"Leave","method":GameManager.closePrompt}],
PromptSprites.armyguytalker
)
#case refuse:
func accept_for_fame():
	GameManager.closePrompt()
	GameState.boolStates["finishedTalkingWithArmyguy"] = true
	GameState.boolStates["soldToArmyGuyWithRestrictions"] = true #is this instant failure?
	GameManager.displayPrompt(armyGuyDialogueAcceptConditionsFame)
func refuse_army_guy():
	GameManager.closePrompt()
	GameManager.displayPrompt(armyGuyDialogueRefuse)
func refuse_army_guy_final():
	GameManager.closePrompt()
	GameState.boolStates["finishedTalkingWithArmyguy"] = true
	GameState.boolStates["refusedArmyGuy"] = true
var armyGuyDialogueRefuse = Prompt.new(
	"Are you sure young man ? Think of the possibilities, the advancement in national security.
You could become famous.",
[
	{"text":"I do want to be famous","method":self.accept_for_fame},
	{"text":"Decline", "method" : self.refuse_army_guy_final}
],
PromptSprites.armyguytalker
)
var armyGuyDialogueAcceptConditionsFame = Prompt.new(
	"You are right. I want people to know of my achievements. I will sell you "+
	"the prototype. But I have some conditions. I want strict limitations on how the "+
	"technology can be used, particularly to ensure it's not used for anything harmful",
[{"text":"Next","method":after_accept_conditionally}],
PromptSprites.playerTalker
)
var armyGuyDialogueAfterRefuse = Prompt.new(
	"Should you change your mind, you know where to find me.",
[
	{"text":"Leave","method":GameManager.closePrompt},
	#{"text":"Reconsider","method":GameManager.closePrompt}
],
PromptSprites.armyguytalker
)






################################################################################
# Talk to the lab
################################################################################
#positive guy
func discuss_entry_army_lab_positive(): # <- Entry for discussing with the yes man
	GameManager.displayPrompt(armyLabStartPositive)
func discussArmyWithLabPositiveAnswer():
	GameManager.closePrompt()
	GameManager.displayPrompt(armyLabAnswerPositive)
var armyLabStartPositive = Prompt.new(
	"I've just talked with the army, they want to buy our prototype!",
[{"text":"Next","method":discussArmyWithLabPositiveAnswer}],
PromptSprites.playerTalker
)
var armyLabAnswerPositive = Prompt.new(
	"That's crazy! Imagine the amount of money we could get! We could make "+
	"history! Imagine what this could mean for our research, our careers! We have to
go for it!",
[{"text":"Leave","method":GameManager.closePrompt}],
PromptSprites.scientist01Talker
)
#negative guy
func discuss_entry_army_lab_negative(): # <- Entry for discussing with the yes man
	GameState.boolStates["discussedArmyGuyWithLab"] = true
	GameManager.displayPrompt(armyLabStartNegative)
func discussArmyWithLabNegativeAnswer():
	GameManager.closePrompt()
	GameManager.displayPrompt(armyLabAnswerNegative)
var armyLabStartNegative = Prompt.new(
	"I've just talked with the army, they want to buy our prototype!",
[{"text":"Next","method":discussArmyWithLabNegativeAnswer}],
PromptSprites.playerTalker
)
var armyLabAnswerNegative = Prompt.new(
	"Are you out of your mind? They're just gonna kill people with no further thought of helping advance humanity! "
	+"I can't believe you'd even consider it.",
[{"text":"Leave","method":GameManager.closePrompt}],
PromptSprites.scientist01Talker
)
