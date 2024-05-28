extends Node

################################################################################
# Dialogues for the family at home:
# Dialogues:
# 1. Your wife: `discuss_entry_wife()`
# 2. Your kid: `discuss_entry_kiddo()`
################################################################################

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
	"Sounds like a plan. Thanks, honey.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)


################################################################################
# Talk to Kiddo
################################################################################
func discuss_entry_kiddo():
	if GameState.boolStates["gotNewDialogueForKid"]:
		GameManager.displayPrompt(kid_begin)
	else:
		GameManager.displayPrompt(kid_going_to_bed)


var kid_begin = Prompt.new(
	"Daddy, how was work today? Did you learn something cool?",
	[
		{"text":"I'm tired","method":func():GameManager.displayPrompt(kid_dont_talk)},
		{"text":"Yes I did","method":explain_stuff_to_kiddo}
	],PromptSprites.kid
)

var kid_going_to_bed =  Prompt.new(
	"Gonna go to bed...",
		[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.kid
)

var kid_dont_talk = Prompt.new(
	"Sorry kiddo. I’m really busy right now. Maybe later, okay?",
		[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

func explain_stuff_to_kiddo():
	GameState.boolStates["gotNewDialogueForKid"] = false
	if GameState.boolStates["talkedAboutSustainability"]:
		GameManager.displayPrompt(kid_sustainability_choice)
	elif GameState.boolStates["talkedToAuthority"]:
		GameManager.displayPrompt(kid_authority_choice)
	elif GameState.boolStates["talkedToCoproration"]:
		GameManager.displayPrompt(kid_personal_gain_choice)
	else:
		GameManager.displayPrompt(kid_after_army_choice)



var kid_after_army_choice = Prompt.new(
	"Today was interesting. I had to make a decision about whether to sell my "+
	"invention to the military or not. Made me think about how...",
	[
		{"text":"Principles are important","method":kid_after_army_good_choice},
		{"text":"Opportinities are easy to miss","method":kid_after_army_bad_choice}
	],PromptSprites.playerTalker
)
func kid_after_army_good_choice():
	GameState.correct_teaching_to_kid["army"]=true
	GameManager.displayPrompt(kid_army_option_good)
func kid_after_army_bad_choice():
	GameState.correct_teaching_to_kid["army"] = false
	GameManager.displayPrompt(kid_army_option_bad)

var kid_army_option_good = Prompt.new(
	"...standing by your "+
	"principles is more important than the promise of money or fame.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)
var kid_army_option_bad =  Prompt.new(
	"...when an an opportunity presents itself, "+
	"You cannot hesitate for one secone, or you might lose it forever.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)


var kid_personal_gain_choice =  Prompt.new(
	"Today I've been pondering about whether to prioritize my own interests "+
	"or think about the greater good. "+
	"But when you think about it, it's obvious that...",
	[
		{"text":"Sometimes, you come first","method":kid_personal_gain_bad_choice},
		{"text":"There's no point being selfish","method":kid_personal_gain_good_choice}
	],PromptSprites.playerTalker
)
func kid_personal_gain_bad_choice():
		GameState.correct_teaching_to_kid["personal_gain"]=false
		GameManager.displayPrompt(kid_personal_gain_good)
func kid_personal_gain_good_choice():
		GameState.correct_teaching_to_kid["personal_gain"]=true
		GameManager.displayPrompt(kid_personal_gain_bad)

var kid_personal_gain_good = Prompt.new(
	"...I need to stay true to my values and work for the greater good.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)
var kid_personal_gain_bad = Prompt.new(
	"...at the end of the day, the only reason society got this far is because everyone tried to make it the best for themselves.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var kid_authority_choice = Prompt.new(
	"Today, I had to deal with some government regulations and oversight on my project. "+
	"It got me thinking that...",
	[
		{"text":"It's best to be transparent","method":kid_authority_good_choice},
		{"text":"People just freeload if you let them","method":kid_authority_bad_choice}
	],PromptSprites.playerTalker
)

func kid_authority_bad_choice():
		GameState.correct_teaching_to_kid["authority"]=false
		GameManager.displayPrompt(kid_authority_bad)
func kid_authority_good_choice():
		GameState.correct_teaching_to_kid["authority"]=true
		GameManager.displayPrompt(kid_authority_good)

var kid_authority_good = Prompt.new(
	"...it's for the best to collaborate with others and follow rules to ensure the "+
	"safety and security of what we're working on. But more importantly, to share when there are risks!",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var kid_authority_bad = Prompt.new(
	"...people will take all you have done, make one final change and proclaim it as all their work.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)



var kid_sustainability_choice = Prompt.new(
	"Today, I was confronted something I hadn't thought about until now. "+
	"Teleportation is cool, but not really great for the environment...",
	[
		{"text":"Its better to fix issues first","method":kid_sustainability_good_choice},
		{"text":"But its worth the cost","method":kid_sustainability_bad_choice}
	],PromptSprites.playerTalker
)


func kid_sustainability_bad_choice():
		GameState.correct_teaching_to_kid["sustainability"]=false
		GameManager.displayPrompt(kid_sustainability_bad)
func kid_sustainability_good_choice():
		GameState.correct_teaching_to_kid["sustainability"]=true
		GameManager.displayPrompt(kid_sustainability_good)

var kid_sustainability_good = Prompt.new(
	"...but there is greater benefit in fixing issues before polluting the world.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var kid_sustainability_bad = Prompt.new(
	"...but even if we put in the effor to be better, there will always be someone who doesn't. "+
	"So it might as be us, at leas that way we're the ones benefitting.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)
