extends Node




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
	[{"text":"next","method":after_accept_merchant}]
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
	[{"text":"Leave","method":GameManager.closePrompt}]
)
var corpo_after_refusing = Prompt.new(
	"Sorry to hear you are not interested. It's a huge loss for everyone, especially you.",
	[{"text":"Leave","method":GameManager.closePrompt}]
)
