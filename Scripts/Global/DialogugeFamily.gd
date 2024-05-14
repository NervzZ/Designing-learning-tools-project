extends Node



################################################################################
# Talk to Wife
################################################################################
func discuss_entry_wife():
	GameManager.displayPrompt(wife_begin)
var wife_begin = Prompt.new(
	"Hey, how was your day?",
	[{"text":"Busy","method":func():GameManager.displayPrompt(wife_response)}],PromptSprites.wife
)
var wife_response = Prompt.new(
	"Busy, as always. But making progress.",
	[{"text":"Next","method":func():GameManager.displayPrompt(wife_good_to_hear)}],PromptSprites.playerTalker
)

var wife_good_to_hear = Prompt.new(
	"That's good to hear. Dinner's almost ready. How about you take a break and relax for a bit?",
	[{"text":"Ok","method":func():GameManager.displayPrompt(wife_kk)}],PromptSprites.wife
)

var wife_kk = Prompt.new(
	"Sounds like a plan. Thanks, hon.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.wife
)


################################################################################
# Talk to Kiddo
################################################################################
var kid_begin = Prompt.new(
	"Daddy, how was work today? Did you learn something cool?",
	[
		{"text":"I'm tired","method":GameManager.displayPrompt(kid_dont_talk)},
		{"text":"Be mindful of future consequenes","method":GameManager.displayPrompt(kid_frst_hidden_option),"display":"InvestigatedRisks"},
		{"text":"Keep to your principles","method":GameManager.displayPrompt(kid_army_option),"display":"refusedArmyGuy"},
		{"text":"Keep to your principles","method":GameManager.displayPrompt(kid_corporation_option),"display":"refusedToSellToCorporation"},
		{"text":"Work for the greater good","method":GameManager.displayPrompt(kid_personal_gain_option),"display":"didNotMisuseForPersonalGain"},
		{"text":"Nothing is selfcontained","method":GameManager.displayPrompt(kid_sustainability),"display":"agreeToSustainability"},
	],PromptSprites.kid
)
var kid_dont_talk = Prompt.new(
	"Sorry kiddo. I’m really busy right now. Maybe later, okay?",
		[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var kid_frst_hidden_option = Prompt.new(
	"Well, today I learned about the importance of being patient and think"+
	" before making decisions. It's not always easy, but it's important to take the "+
	"time to consider all the consequences of your actions.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var kid_army_option = Prompt.new(
	" Today was interesting. I had to make a decision about whether to sell my "+
	"invention to the military or not. I learned that sometimes, standing by your "+
	"principles is more important than the promise of money or fame.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)


var kid_corporation_option = Prompt.new(
	"Today, I had to make a decision about whether to sell my invention to a "+
	"big corporation. It was a tough choice, but I learned that sometimes, "+
	"staying true to your values means standing up against pressure. It is "+
	"hard as you may lose out on a big opportunity.",
		[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)


var kid_personal_gain_option = Prompt.new(
	"I had to make a tough decision today about whether to prioritize my own interests "+
	"or think about the greater good. It taught me the importance of staying true to my values.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var kid_authority = Prompt.new(
	"Today, I had to deal with some government regulations and oversight on my project. "+
	"I learned that it's important to work with others and follow rules to ensure the "+
	"safety and security of what I'm working on.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)



var kid_sustainability = Prompt.new(
	"I learned about the significance of sustainability in my work. It's not just "+
	"about creating something cool; it's about making sure it's good for the environment too. "+
	"That's something we should always keep in mind !",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)
