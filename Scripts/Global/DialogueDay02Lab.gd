extends Node



################################################################################
# Talk to the army guy
################################################################################
func discuss_entry_armyguy(): # <- call this when interacting with army guy
	if GameState.boolStates["startedTalingWithArmyguy"]:
		pass #ask what the answer is now
	elif GameState.boolStates["finishedTalkingWithArmyguy"]:
		if GameState.boolStates["refusedArmyGuy"]:
			pass
		elif (GameState.boolStates["soldToArmyGuyNoRestrictions"] or 
				GameState.boolStates["soldToArmyGuyNoRestrictions"]):
			GameManager.displayPrompt(armyGuyDialogueAfterAccept)
		else:
			print("dafaq happend?")
	else:
		GameState.boolStates["startedTalingWithArmyguy"]=true
		GameManager.displayPrompt(armyGuyDialoguePitch)

var armyGuyDialoguePitch = Prompt.new(
	"Hello. I assume you've been informed of my visit today? I am [Army Guy],
head of the military procurement department.
I wanted to discuss the future of your teleporter prototype in person. We're
very impressed with what we've seen so far. We believe this could be a
game-changer and would like to discuss the possibility of acquiring it for
military use.",
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
	"I'm open to the idea of selling it, but I have some conditions. I want
strict limitations on how the technology can be used, particularly to ensure
it's not used for anything harmful",
[{"text":"Next","method":self.after_accept_conditionally}],
PromptSprites.playerTalker
)
var armyGuyDialogueAfterCondition = Prompt.new(
	"We understand your concerns. We're willing to negotiate terms that prioritize safety and
ethical use of the technology. I'm sure we can hash out a deal that's in everyone's best interest.",
[{"text":"Next","method":GameManager.closePrompt}],
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
	{"text":"Conditionally agree","method":self.accept_for_fame},
	{"text":"Decline", "method" : self.refuse_army_guy_final}
],
PromptSprites.armyguytalker
)
var armyGuyDialogueAcceptConditionsFame = Prompt.new(
	"You are right. I want people to know of my achievements. I will sell you
the prototype. But I have some conditions. I want strict limitations on how the
technology can be used, particularly to ensure it's not used for anything
harmful",
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
