extends Node





func discuss_entry_government():
	GameState.boolStates["didntSellToArmyAndFoundOutAboutStability"] = (
					GameState.boolStates["InvestigatedRisks"] 
					and GameState.boolStates["soldToArmyGuyNoRestrictions"])
	if not GameState.boolStates["talkedToAuthority"]:
		GameManager.displayPrompt(start_government_dialogue)
		GameState.boolStates["talkedToAuthority"]= true
	else:
		if GameState.boolStates["admittedIssuesToAuthority"]:
			GameManager.displayPrompt(after_admit_to_dangers)
		else:
			GameManager.displayPrompt(after_no_monitor)

var start_government_dialogue = Prompt.new(
	"Hello. We've been monitoring the development of your teleportation technology closely. "+
	"As it nears completion, we need to ensure that it meets safety and regulatory standards "+
	"before it can be deployed to the public.",
	[
		{"text":"There are no issues","method":func():GameManager.displayPrompt(no_issues_response),"display":"soldToArmyGuyNoRestrictions","inverse":true},
		{"text":"Admit to dangers","method":func():GameManager.displayPrompt(admit_to_dangers),"display":"didntSellToArmyAndFoundOutAboutStability"},#only visible if found
		{"text":"Not in my control","method":func():GameManager.displayPrompt(not_in_my_control),"display":"soldToArmyGuyNoRestrictions"}, #sold to army no restriction
		{"text":"Don't want government control","method":func():GameManager.displayPrompt(dont_want_to_be_monitored),"display":"soldToArmyGuyNoRestrictions","inverse":true},
	]
)

var admit_to_dangers = Prompt.new(
	"Actually, there are some concerns about the stability of the device that I think you should be "+
	"aware of… We should take care of this together before putting it on the market.",
	[
		{"text":"Next","method":after_admit},
	],
	PromptSprites.playerTalker
)
var after_admit_to_dangers = Prompt.new(
	"Thank you for bringing this to our attention. "+
	"We'll investigate further and work with you to address any issues before proceeding.",
	[{"text":"Leave","method":GameManager.closePrompt}]
)

var no_issues_response = Prompt.new(
	"I believe my prototype is safe and ready to be used. I don’t want to lose more time. "+
	"My device is already of high quality and is really safe.",
	[{"text":"Leave","method":GameManager.closePrompt}]
)

func after_admit():
	GameManager.closePrompt()
	GameState.boolStates["admittedIssuesToAuthority"] = true
	GameManager.displayPrompt(after_admit_to_dangers)




var not_in_my_control = Prompt.new(
	" I'm sorry, but I've already sold the technology to the military without "
	+"any restrictions. I can't comply with your demands.",
	[{"text":"Next","method":func():GameManager.displayPrompt(after_explain_army)}]
)

var after_explain_army = Prompt.new(
	"That's unfortunate... We'll have to take appropriate action to ensure the safety and security "+
	"of the public, maybe disallow it completely",
	[{"text":"Leave","method":GameManager.closePrompt}]
)


var dont_want_to_be_monitored = Prompt.new(
	"I'm sorry, but I can't comply with your demands. I can't allow you to dictate how I "+
	"develop my invention .",
	[{"text":"Next","method":no_monitor_pls}],
	PromptSprites.playerTalker
)

func no_monitor_pls():
	GameManager.closePrompt()
	GameState.mistakes_made += 1
	GameManager.displayPrompt(after_no_monitor)

var after_no_monitor = Prompt.new(
	"Very well. We'll have to investigate further and determine the appropriate course of action.",
	[{"text":"leave","method":GameManager.closePrompt}]
)
