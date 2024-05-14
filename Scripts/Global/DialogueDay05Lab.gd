extends Node


func discuss_entry_sustainability():
	if not GameState.boolStates["talkedAboutSustainability"]:
		GameState.boolStates["talkedAboutSustainability"] = true
		GameManager.displayPrompt(sustainability_dialogue_start)
	else:
		if GameState.boolStates["agreeToSustainability"]:
			GameManager.displayPrompt(after_accept)
		else:
			GameManager.displayPrompt(after_refuse)


var sustainability_dialogue_start = Prompt.new(
	"Have you considered the sustainability aspect of your invention? It's crucial to ensure that "+
	"it takes care of the environment as well. We need to make an effort here.",
	[
		{"text":"Agree","method":func():GameManager.displayPrompt(agree_sustainability)},
		{"text":"Out of my control", "method":func():GameManager.displayPrompt(cant_agree)},
		{"text":"Disagree","method":func():GameManager.displayPrompt(who_cares)}
	],PromptSprites.scientist01Talker
)


var agree_sustainability = Prompt.new(
	"You’re right. Ensuring that our device is sustainable is essential. Sustainability concerns "+
	"everyone, including scientists ! I will definitely dedicate time finding sustainable materials "+
	"and enhance the ecological impact. I just need some funds because this requires a bit more research.",
	[{"text":"Next","method":agree}],PromptSprites.playerTalker
)
func agree():
	GameManager.closePrompt()
	GameState.boolStates["agreeToSustainability"] = true
var agree_sustainability_ans_frnd = Prompt.new(
	"Theres Sustainable Corp who are willing to help you develop this great invention, "+
	"doing the best for sustainability",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var cant_agree = Prompt.new(
	"I understand and believe the importance of sustainability, but I'm afraid my hands are tied. "+
	"I sold the project to a corporation, and I'm no longer in control of the decision-making process.",
	[{"text":"next","method":func():GameManager.displayPrompt(response_to_cant_agree)}],PromptSprites.playerTalker
)

var response_to_cant_agree = Prompt.new(
	"That's unfortunate. It's a shame they're not prioritizing sustainability. "+
	"But I guess that's the reality of big corporate interests",
	[{"text":"Next","method":func():GameManager.displayPrompt(not_so_inner_monologue)}],
	PromptSprites.scientist01Talker
)
var not_so_inner_monologue = Prompt.new(
	"It's frustrating to see the project I've worked so hard on being steered "+
	"in a direction that doesn't prioritize sustainability at all…",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var who_cares = Prompt.new(
	"I appreciate your concern, but I don't think sustainability "+
	"is a priority for scientists like us. It would slow down the development process too much.",
	[{"text":"Next","method":func():GameManager.displayPrompt(who_cares_response)}],PromptSprites.playerTalker
)

var who_cares_response = Prompt.new(
	"But think of the long-term impact on the environment. We have a "+
	"responsibility to minimize our ecological footprint",
	[{"text":"Next","method":func():GameManager.displayPrompt(for_real_who_cares)}],PromptSprites.scientist01Talker
)
var for_real_who_cares = Prompt.new(
	"I understand, but I have to focus on the task at hand. Sustainability can be someone else's problem.",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.playerTalker
)

var after_accept = Prompt.new(
	"Good talk.",[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.scientist01Talker
)

var after_refuse = Prompt.new(
	"Shame about the sustainability if you ask me...",
	[{"text":"Leave","method":GameManager.closePrompt}],PromptSprites.scientist01Talker
)
