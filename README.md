# Dialogue using Resources
A simple dialogue system that uses resources. Logic to be handled by you!

## Installation
- Download this repository.
	- You can do this by using git:
		`git clone https://github.com/WinnerWind/resource-based-dialogue.git`
	- Download the ZIP by clicking the green `<> Code` button just above, and selecting **Download ZIP**
- Move the folder `Dialogue Resources` anywhere in your project.
- Reload your editor.
- You should have access to the classes `DialogueAct`, `DialogueCharacter`, `DialogueLine` and `DialogueChoice`. If so, then you are done.
- Plugin (WIP!)
## Benefits
- Simple, Minimalist
- Logic is handled by you (Can use your own logic if you so desire!)
- Easily Extensible (Just 60 lines!)

## Explanation
### Example Logic
```gdscript
@export var current_dialogue:DialogueAct
func _ready() -> void:
	read_dialogue(current_dialogue)

func read_dialogue(dialogue:DialogueAct):
	for line:DialogueLine in dialogue.dialogue_lines:
		print("%s]>> %s"%[line.speaker_name,line.text])
	
	if dialogue.is_at_end:
		print("END OF DIALOGUE")
	else:
		present_choices(dialogue.choices)

func present_choices(choices:Array[DialogueChoice]):
	print("--- CHOICES ---")
	var index:int = 0
	for choice:DialogueChoice in choices:
		index+=1
		print("OPTION %s. %s"%[index,choice.text])
	
	await select_choice(choices)

func select_choice(choices:Array[DialogueChoice]):
	await any_key_pressed
	if Input.is_action_just_pressed("Choice1"):
		read_dialogue(choices[0].dialogue_to_start)
	elif Input.is_action_just_pressed("Choice2"):
		read_dialogue(choices[1].dialogue_to_start)
	elif Input.is_action_just_pressed("Choice3"):
		read_dialogue(choices[2].dialogue_to_start)
	elif Input.is_action_just_pressed("Choice4"):
		read_dialogue(choices[3].dialogue_to_start)

signal any_key_pressed
func _input(event: InputEvent) -> void:
	if event.is_pressed():
		any_key_pressed.emit()
```
### Explanation and Documentation
#### Introduction
The heart of the system is contained in the DialogueAct class. It is a Resource. It is meant to be used for complete and linear dialogue. Any choices must be placed at the end of the DialogueAct class; the meat and potatoes of it takes place in its linear methodology. It contains two arrays, one for the dialogue itself, and another for the choices.

Next up is the DialogueChoice class, which is also a Resource. It is very simple, and just takes a string for the text, and another DialogueAct. In this way, each dialogue choice can be used to start their own act.

There's also the DialogueLine class, which is used for each line in a DialogueAct. It takes a text, a DialogueCharacter (More on this soon), and an optional Custom Speaker Name.

DialogueCharacter is used for a character in a dialogue. It can be used for, say portraits and for defining custom names.
#### Documentation
##### `DialogueAct`
- Extends `Resource`
- `dialogue_lines` (`Array[DialogueLine]`) -> Used for each line in a dialogue
- `choices` (`Array[DialogueChoice]`) -> Used to store each choice in a dialogue.
- `is_at_end` (`bool`) -> Used to flag whether the current `DialogueAct` is at the end of a given dialogue. If so, `choices` is to be ignored. 
##### `DialogueLine`
- Extends `Resource`
- `custom_speaker_name` (`String`) -> Used to store a temporary name, used only for the current line. Could be used to give certain people the name `(???)` or for things that don't need a character.
- `character` (`DialogueCharacter`) -> Stores the character that the current line is being spoken by.
- `text` (`String` <sub>Multiline</sub>) -> Stores the text that is the current dialogue.
- `speaker_name` (`String`) -> Use this if you need to get the name of the speaker. Returns `custom_speaker_name` if it's set, or else it returns the name of the Character.
##### `DialogueChoice`
- Extends `Resource`
- `text` (`String`) -> The name of the current choice, or the dialogue that the character speaks out/thinks.
- `dialogue_to_start` (`DialogueAct`) -> If the current choice is selected, then this is the dialogue that must be started.
##### `DialogueCharacter`
- Extends `Resource`
- `character_name` (`String`) -> Name of the character.
<sup> This class is meant to be extended on your own. I have just provided a basic implementation for you to build upon.
