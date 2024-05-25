extends Node

################################################################################
# Dialogues for Day 3 at the lab:
# Dialogues:
# 1. Corporation wants to buy prototype and hire you `discuss_entry_merchant()`
# 2. Your friends misuse invention `discuss_entry_optional_dumb_friends()`
################################################################################


################################################################################
# Talk to corporations guy
################################################################################
func discuss_entry_merchant():
	if not GameState.boolStates["talkedToCoproration"]:
		GameManager.displayPrompt(corporationsPitch)
		GameState.boolStates["talkedToCoproration"] = true
	else:
		if 	GameState.boolStates["soldToCorporation"]:
			GameManager.displayPrompt(copro_after_accepting)
		else:
			GameManager.displayPrompt(corpo_after_refusing)

func accept_merchant():
	GameManager.closePrompt()
	GameState.boolStates["soldToCorporation"] = true
	GameManager.displayPrompt(corpo_accept)
func merchant_tries_to_convince():
	GameManager.closePrompt()
	GameManager.displayPrompt(corpor_try_to_convince)
func accept_merchant_after_convincing():
	GameManager.closePrompt()
	GameState.boolStates["soldToCorporation"] = true
	GameManager.displayPrompt(corpo_accept_after_convincing)
func refuse_merchant_after_convincing():
	GameManager.closePrompt()
	GameState.boolStates["refusedToSellToCorporation"] = true
	GameManager.displayPrompt(corpo_final_refusal)
func refuse_merchant():
	GameManager.closePrompt()
	GameManager.displayPrompt(corpo_refuse)
func after_accept_merchant():
	GameManager.closePrompt()
	GameManager.displayPrompt(copro_after_accepting)
func after_refusing_merchant():
	GameManager.closePrompt()
	GameManager.displayPrompt(corpo_after_refusing)
var corporationsPitch = Prompt.new(
	"Hello, I work for [Corporation]. We've been following your "+
	"progress closely, and we're impressed. Your prototype has the potential to "+
	"revolutionize transportation and commerce. Would you agree to discuss the "+
	"purchase of your prototype and work for us?",
	[
		{"text":"Accept","method":accept_merchant},
		{"text":"Refuse","method":refuse_merchant}
	],
	PromptSprites.merchant
)

var corpo_accept = Prompt.new(
	"Thank you for your consideration. I'm indeed interested to discuss with you for further business.",
	[{"text":"Next","method":after_accept_merchant}],
	PromptSprites.playerTalker
)
var corpo_refuse = Prompt.new(
	"I appreciate the offer, but I have to consider the implications of selling "+
	"my invention. It's not just about the money; there are ethical and societal "+
	"considerations to think about. I can’t risk my invention falling into the wrong hands",
	[{"text":"Next","method":merchant_tries_to_convince}],
	PromptSprites.playerTalker
)
var corpor_try_to_convince = Prompt.new(
	"I understand your concerns, but imagine the opportunities this partnership "+
	"could bring. You could be at the forefront of a technological revolution, "+
	"with your name known worldwide!",
	[{"text":"Accept","method":accept_merchant_after_convincing},
	{"text":"Refuse","method":refuse_merchant_after_convincing}],
	PromptSprites.merchant
)
var corpo_accept_after_convincing = Prompt.new(
	"You make a compelling argument. Alright, I'm willing to accept your offer. "+
	"Let's discuss the details of the partnership.",
	[{"text":"next","method":after_accept_merchant}],
	PromptSprites.playerTalker
)
var copro_after_accepting = Prompt.new(
	"Fantastic! We're thrilled to have you on board. We'll work together to ensure "+
	"your invention reaches its full potential. We will make you famous. "+
	"Don’t worry about your wealth anymore",
	[{"text":"Leave","method":GameManager.closePrompt}],
	PromptSprites.merchant
)
var corpo_final_refusal = Prompt.new(
	"I have to decline once again. My decision is final. Thank you for considering my prototype, "+
	"but I believe I must guarantee its final use.",
	[{"text":"Leave","method":GameManager.closePrompt}],
	PromptSprites.playerTalker
)
var corpo_after_refusing = Prompt.new(
	"Sorry to hear you are not interested. It's a huge loss for everyone, especially you.",
	[{"text":"Leave","method":GameManager.closePrompt}],
	PromptSprites.merchant
)




################################################################################
# Optional, Talk to friends and maybe misuse invention
###############################################################################
func discuss_entry_optional_dumb_friends():
	if not GameState.boolStates["talkedToFriendsOptionalStealing"]:
		GameManager.displayPrompt(dumb_friend_prompt1)
		GameState.boolStates["talkedToFriendsOptionalStealing"]=true
	else:
		if GameState.boolStates["misusedForPersonalGain"]:
			GameManager.displayPrompt(reaction_afer_stealing)
		else:
			GameManager.displayPrompt(reaction_after_not_stealing)

func show_2nd_prompt():
	GameManager.closePrompt()
	GameManager.displayPrompt(dumb_friend_prompt2)
func show_3rd_prompt():
	GameManager.closePrompt()
	GameManager.displayPrompt(dumb_friend_prompt3)
func show_4th_prompt():
	GameManager.closePrompt()
	GameManager.displayPrompt(dumb_friend_prompt4)
func show_after_stealing():
	GameState.boolStates["misusedForPersonalGain"] = true
	GameManager.closePrompt()
	GameManager.displayPrompt(reaction_afer_stealing)
func show_after_not_stealing():
	GameManager.closePrompt()
	GameState.boolStates["didNotMisuseForPersonalGain"] = true
	GameManager.displayPrompt(reaction_after_not_stealing)
var dumb_friend_prompt1 = Prompt.new(
	"Hey, have you heard about that new project [Player Character] is working on? It's getting a lot of attention.",
	[{"text":"Next","method":show_2nd_prompt}],
	PromptSprites.scientistBrownTalker
)
var dumb_friend_prompt2 = Prompt.new(
	"Yeah, I heard about it. Do you think there's any way we could benefit from it ?",
	[{"text":"What's going on?","method":show_3rd_prompt}],
	PromptSprites.scientistBlondeTalker
)
var dumb_friend_prompt3  = Prompt.new(
	"We were just talking about your project. It's really taking off.",
	[{"text":"Next","method":show_4th_prompt}],
	PromptSprites.scientistBrownTalker
)
var dumb_friend_prompt4  = Prompt.new(
	"We were just talking about your project. It's really taking off."+
	" We also figured, since we can actually teleport anywhere, why not use it to "+
	" 'Acquire' some money?",
	[{"text":"Steal with them","method":show_after_stealing},
	{"text":"Remind them of the archimedian oath","method":show_after_not_stealing}],
	PromptSprites.scientistBlondeTalker
)

var reaction_afer_stealing = Prompt.new(
	"That was way easier than expected haha, never have to worry about money"+
	" ever again!",
	[{"text":"Leave","method":GameManager.closePrompt}],
	PromptSprites.scientistBrownTalker
)
var reaction_after_not_stealing = Prompt.new(
	"We were just joking around...
We know we have a responsibility to use our talents for the greater good and not just for personal gain.",
	[{"text":"Leave","method":GameManager.closePrompt}],
	PromptSprites.scientistBlondeTalker
)








